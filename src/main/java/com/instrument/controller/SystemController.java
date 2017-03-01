package com.instrument.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.instrument.dao.InformationDAO;
import com.instrument.domain.Information;
import com.instrument.domain.Message;
import com.instrument.domain.User;
import com.instrument.service.InformationService;
import com.instrument.service.MessageService;
import com.instrument.service.NameOrPasswordException;
import com.instrument.service.SystemService;
import com.instrument.util.CreateImageCode;


@Controller
public class SystemController {
	@Resource(name = "systemService")
	private SystemService ss;
	
	
	@Resource(name = "messageService")
	private MessageService ms;
	
	
	@Resource(name = "informationService")
	private InformationService informationService;
	
	@RequestMapping("/toLogin")
	public String toLogin(){
		//vCode.write(response.getOutputStream());
		return "login";
	}
	
	
	@RequestMapping("/login")
	@ResponseBody
	public JsonResult<User> login(String username, String password, String inputcode, HttpServletResponse response, HttpSession session){


			try{
				User user=ss.checkLogin(username, password);
				session.setAttribute("username", username);	
				String code = (String) session.getAttribute("code");
				if(!inputcode.equals(code)){
					throw new NameOrPasswordException(3, "验证码错误");
				}
				System.out.println(code);
				return new JsonResult<User>(user);
			}catch(NameOrPasswordException e){
				e.printStackTrace();
				return new JsonResult<User>(
					e.getField(), e.getMessage(), 
					null);
			}catch(Exception e){
				e.printStackTrace();
				return new JsonResult<User>(e);
			}
	}
	
	@RequestMapping("/logout")
	String logout(Model model,HttpSession session) {
		model.asMap().remove("username");
		session.invalidate();
		return "/logout";
	}
	
	
	@RequestMapping("/code")
	public void getCode(HttpServletRequest req, HttpServletResponse response,HttpSession session) throws IOException{
		// 设置响应的类型格式为图片格式
        response.setContentType("image/jpeg");
        //禁止图像缓存。
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        
        CreateImageCode vCode = new CreateImageCode(100,30,5,10);
        System.out.println(vCode.getCode());
        session.setAttribute("code", vCode.getCode());
        vCode.write(response.getOutputStream());
	}
	
	
	@RequestMapping("/tochangePassword")
	public String changePassword(){
		return "pass";
	}
	
	@RequestMapping("/changePassword")
	public String changePassword(HttpServletRequest request){
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String newpass = request.getParameter("newpass");
		String renewpass = request.getParameter("renewpass");
		

		boolean a =  ss.checkPassword(username, password);
		if(a == false){
			request.setAttribute("message", "密码错误");
			request.setAttribute("href", "tochangePassword");
			return "message";
		}
		ss.changePassword(username,newpass);
		request.setAttribute("message", "更改密码成功");
		request.setAttribute("href", "tochangePassword");	
		return "message";
	}
	
	@RequestMapping("/toregister")
	public String register(){
		return "register";
	}
	
	@RequestMapping("/register")
	public String register(HttpServletRequest request){
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String repassword = request.getParameter("repassword");
		
		Boolean a = ss.checkUsername(username);
		if(a == false){
			request.setAttribute("message", "用户名重复");
			request.setAttribute("href", "toregister");
			return "message";
		}

		ss.register(username, repassword);
		request.setAttribute("message", "注册成功");
		request.setAttribute("href", "toregister");	
		return "message";
	}
	
	@RequestMapping("/words")
	public String message(HttpServletRequest request){
		
		int pageNum; 
		if(request.getParameter("curPage") == null || request.getParameter("curPage") == "1" ){
			 pageNum = 1;
		}else{
			pageNum = Integer.parseInt(request.getParameter("curPage"));
		}

		PageHelper.startPage(pageNum, 10); // 核心分页代码
		
		List<Message> list = ms.getMessage();
		

		request.setAttribute("recordNumber",list.size());
		request.setAttribute("listQuery", list);
		request.setAttribute("pages", (list.size()/10)+1);
		request.setAttribute("currentPage", pageNum);
		request.setAttribute("message", ms.getMessage());	
		
		
		return "words";
	}
	
	@RequestMapping("/information")
	public String information(HttpServletRequest request){
		
		request.setAttribute("aboutUs", informationService.getDetail("aboutUs"));
		request.setAttribute("address", informationService.getDetail("address"));
		request.setAttribute("phone", informationService.getDetail("phone"));
		request.setAttribute("telephone", informationService.getDetail("telephone"));
		
		return "adv";
	}
	
	@RequestMapping("/updateInformation")
	public String updateInformation(@RequestParam(value="address")String address,@RequestParam(value="aboutUs")String aboutUs,@RequestParam(value="phone")String phone, @RequestParam(value="telephone")String telephone, HttpServletRequest request){
		
		Information information = new Information();
		information.setInformationname("address");
		information.setDetail(address);
		informationService.updateInformation(information);
		
		information.setInformationname("aboutUs");
		information.setDetail(aboutUs);
		informationService.updateInformation(information);
		
		information.setInformationname("phone");
		information.setDetail(phone);
		informationService.updateInformation(information);
		
		information.setInformationname("telephone");
		information.setDetail(telephone);
		informationService.updateInformation(information);
		
		request.setAttribute("message","修改成功");
		request.setAttribute("href", "information");
		return "message";
	}
	
	@RequestMapping("/delMessage")
	@ResponseBody
	public boolean delMessage(int id, HttpServletRequest request){
		
		ms.delMessage(id);
		
		request.setAttribute("message","修改成功");
		request.setAttribute("href", "information");
		return true;
	}
	
	@RequestMapping("/delMessageList")
	@ResponseBody
	public boolean delMessageList(String id, HttpServletRequest request){
		try {
			String[] delitem = id.split(",");
			for(String item : delitem){
				System.out.println(item);
				ms.delMessage(Integer.parseInt(item));
			}
		} catch (Exception e) {
			return false;
		}
		
		
		return true;
	}
}
