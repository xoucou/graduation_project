package com.instrument.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.instrument.dao.InformationDAO;
import com.instrument.dao.InstrumentDAO;
import com.instrument.dao.InstrumentTypeDAO;
import com.instrument.domain.Instrument;
import com.instrument.domain.InstrumentType;
import com.instrument.service.MessageService;


@Controller
public class IndexController {
	
	@Resource(name = "instrumentDAO")
	private InstrumentDAO instrumentDAO;
	
	@Resource(name = "instrumentTypeDAO")
	private InstrumentTypeDAO instrumentTypeDAO;
	
	@Resource(name = "informationDAO")
	private InformationDAO information ;
	
	
	@Resource(name = "messageService")
	private MessageService ms;
	
	@RequestMapping("/index3")
	public void index(HttpServletRequest request){
		
		List<Instrument> list = instrumentDAO.dynamicQuery(null);
		
		List<InstrumentType> typeList = instrumentTypeDAO.getInstrumentType();
		
		Collections.reverse(list);
		
		request.setAttribute("aboutUs", information.selectByPrimaryKey("aboutUs").getDetail());
		request.setAttribute("address", information.selectByPrimaryKey("address").getDetail());
		request.setAttribute("phone", information.selectByPrimaryKey("phone").getDetail());
		request.setAttribute("telephone", information.selectByPrimaryKey("telephone").getDetail());
		request.setAttribute("instrument", list);
		request.setAttribute("instrumentType", typeList);
		
		//return "index3";
	}
	
	@RequestMapping("/sendMesage")
	@ResponseBody
	public Map<String, String> sendMessage(String proposer, String email, String message, HttpServletRequest request){
		
		 Map<String,String> resultMap = new HashMap<String, String>();  
		
		 if(proposer.trim().equals("")){
			    resultMap.put("result", "姓名不能为空");
			 	return resultMap;
			}
			if(email.trim().equals("")){
				resultMap.put("result", "email不能为空");
				return resultMap;
			}
			if(message.trim().equals("")){
				resultMap.put("result", "建议不能为空");
				return resultMap;
			}
			
//			1. 必须包含一个并且只有一个符号“@”     
//			2. 第一个字符不得是“@”或者“.”     
//			3. 不允许出现“@.”或者.@     
//			4. 结尾不得是字符“@”或者“.”     
//			5. 允许“@”前的字符中出现“＋”     
//			6. 不允许“＋”在最前面，或者“＋@”  
			String check = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";    
			 Pattern regex = Pattern.compile(check);    
			 Matcher matcher = regex.matcher(email);    
			 boolean isMatched = matcher.matches();    
			 if(isMatched == false){
				 resultMap.put("result", "请输入正确的邮箱");
				 return resultMap;
			 }
			    
			 ms.sendMessage(proposer, email, message);
			 resultMap.put("result", "谢谢您的建议!!!");
		
			 return resultMap;
	}
	
	
}
