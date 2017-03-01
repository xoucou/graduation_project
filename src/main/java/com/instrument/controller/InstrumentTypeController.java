package com.instrument.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageHelper;
import com.instrument.domain.InstrumentType;
import com.instrument.service.InstrumentTypeService;

@Controller
@RequestMapping("InstrumentType")
public class InstrumentTypeController {
	
	@Resource(name = "instrumentTypeService")
	InstrumentTypeService instrumentTypeService;
	
//	@RequestMapping("/toadd")
//	public String add(){
//		return "cate";
//	}
	
	@RequestMapping("/add")
	public String add(HttpServletRequest request){
	
		try {
			instrumentTypeService.addInstrumentType(request.getParameter("type"));
			request.setAttribute("message", "操作成功");
			request.setAttribute("href", "toadd");
			return "message";
		} catch (Exception e) {
			e.printStackTrace();
				request.setAttribute("message", "操纵失败!");
				request.setAttribute("href", "toadd");
			return "message";
		}
	}
	@RequestMapping("/toupdate")
	public String update(){
		return "cateedit";
	}
	
	
	@RequestMapping("/update")
	public String update(HttpServletRequest request){
		boolean a = instrumentTypeService.updateInstrumentType(request.getParameter("title"),request.getParameter("newtitle"));
		if(a == true){
			request.setAttribute("message", "更换成功");

		}else{
			request.setAttribute("message", "不存在的分类");

		}
		request.setAttribute("href", "toupdate");
		return "message";
	}
	
	
	@RequestMapping("/toadd")
	public String add(){
        return "cate";
	}
	
	
	@RequestMapping("/list")
	public String list(HttpServletRequest request){
			//int startPage = Integer.parseInt(request.getParameter("aaa"));
			int pageNum; 
			if(request.getParameter("curPage") == null || request.getParameter("curPage") == "1" ){
				 pageNum = 1;
			}else{
				pageNum = Integer.parseInt(request.getParameter("curPage"));
			}
	
			PageHelper.startPage(pageNum, 5); // 核心分页代码
			List<InstrumentType> list = instrumentTypeService.getInstrumentType();
			
			
			request.setAttribute("recordNumber",list.size());
			request.setAttribute("listQuery", list);
			request.setAttribute("pages", (list.size()/5)+1);
			request.setAttribute("currentPage", pageNum);
			
			return "cate";
	}	
	

	@RequestMapping("/delete")
	public String delete(HttpServletRequest request){
		instrumentTypeService.deleteInstrumentType(request.getParameter("delete"));
		
		return "cate";
	}
	
}
