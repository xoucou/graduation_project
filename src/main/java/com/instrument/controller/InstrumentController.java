package com.instrument.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.instrument.dao.InstrumentDAO;
import com.instrument.domain.Instrument;
import com.instrument.service.InstrumentService;
import com.instrument.service.InstrumentTypeService;

@Controller
@RequestMapping("/Instrument")
public class InstrumentController {
	
	@Resource(name = "instrumentDAO")
	private InstrumentDAO instrumentDAO;
	
	@Resource(name = "instrumentService")
	private InstrumentService iService;

	@Resource(name = "instrumentTypeService")
	private InstrumentTypeService ist;

	@RequestMapping("/tolist")
	public String list(String instrumentType,String date, String barcode,String instrumentName,HttpServletRequest request) {
		
		Instrument instrument = new Instrument();
		if(instrumentType != null){
			if(instrumentType.trim().length() != 0){
				instrument.setInstrumenttype(instrumentType);
			}
		}
		if(date != null){
			if(date.trim().length() != 0){
				instrument.setDate(date);
			}
		}
		if(barcode != null){
			if(barcode.trim().length() != 0){
				instrument.setBarcode(barcode);
			}
		}
		if(instrumentName != null){
			if(instrumentName.trim().length() != 0){
				instrument.setInstrumentname(instrumentName);
			}
		}
		
		int pageNum; 
		
		int pages = instrumentDAO.countNum();
		
		
		if(request.getParameter("curPage") == null || request.getParameter("curPage") == "1" ){
			 pageNum = 1;
		}else{
			pageNum = Integer.parseInt(request.getParameter("curPage"));
		}
		
		PageHelper.startPage(pageNum, 8); // 核心分页代码
		
		List<Instrument> list = iService.listInstrument(instrument);
		
		request.setAttribute("queryList", list);
		
		request.setAttribute("instrumentType", ist.getInstrumentType());
		request.setAttribute("recordNumber",pages);
		request.setAttribute("listQuery", list);
		request.setAttribute("pages", (pages/8)+1);
		request.setAttribute("currentPage", pageNum);
		return "list";
	}

	@RequestMapping("/toadd")
	public String toadd(HttpServletRequest request) {
		request.setAttribute("type", ist.getInstrumentType());
		return "add";
	}

	@RequestMapping("/add")
	public String add(HttpServletRequest request) throws IllegalStateException,
			IOException, FileUploadException {

		String path = null;

		Instrument is = new Instrument();
		// 判断enctype属性是否为multipart/form-data
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);

		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);

		// Parse the request
		List items = upload.parseRequest(request);

		Iterator iter = items.iterator();
		while (iter.hasNext()) {
			FileItem item = (FileItem) iter.next();

			if (item.isFormField()) {
				// 如果是普通表单字段
				String name = item.getFieldName();
				String value = item.getString("utf-8");
				if (name.equals("instrumenttype")) {
					is.setInstrumenttype(value);
				}
				if (name.equals("barcode")) {
					is.setBarcode(value);
				}
				if (name.equals("count")) {
					is.setCount(Integer.parseInt(value));
				}
				if (name.equals("date")) {
					is.setDate(value);
				}
				if (name.equals("instrumentname")) {
					is.setInstrumentname(value);
				}
			} else {
				// 如果是文件字段
				String fieldName = item.getFieldName();
				String fileName = item.getName();
				String contentType = item.getContentType();
				boolean isInMemory = item.isInMemory();
				long sizeInBytes = item.getSize();

				String url = "D:/Workspaces/instrument/src/main/webapp/img";

				File saveFile = new File(url, fileName);

				try {
					item.write(saveFile);
					// 向文件中写入数据
					InputStream inStream = item.getInputStream();
				} catch (Exception e) {

				}

				url = "img/" + fileName;

				is.setInstrumentphoto(url);

			}
		}

		 iService.addInstrument(is);

		request.setCharacterEncoding("utf-8");
		request.setAttribute("message", "增加成功");
		request.setAttribute("href", "tolist");
		return "message";
	}
	@RequestMapping("/toUpdate")
	public String update(HttpServletRequest request){
		
		
		return "list";
	}
	@RequestMapping("/delete")
	@ResponseBody
	public boolean  delete(String barcode,HttpServletRequest request) {		
		
		iService.deleteInstrument(barcode);
		
		return true;
	}
	@RequestMapping("/delList")
	public boolean delList(String delitems, HttpServletRequest request){
		System.out.println("aaaaaaaaaaa");
		System.out.println(delitems);
		
		try {
			String[] delitem = delitems.split(",");
			for(String item : delitem){
				System.out.println(item);
				iService.deleteInstrument(item);
			}
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	
		return true;
	}
}
