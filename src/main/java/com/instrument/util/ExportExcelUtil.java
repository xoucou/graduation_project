package com.instrument.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.CellRangeAddress;
import org.apache.poi.hssf.util.HSSFColor;

import com.instrument.domain.Instrument;

public class ExportExcelUtil {

	protected void buildExcelDocument(List<Instrument> list,
			String date, String fileName) throws FileNotFoundException {
		HSSFWorkbook book = new HSSFWorkbook();
		String url = "D:/Workspaces/instrument/清单";
		
			File desFile = new File(url,fileName);
			FileOutputStream fos = new FileOutputStream(desFile);
			HSSFSheet sheet = book.createSheet("Sheet1");
			sheet.autoSizeColumn(1, true);// 自适应列宽度

			// 合并单元格供标题使用(表名)
			sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 4));
			HSSFRow firstRow = sheet.createRow(0);// 第几行（从0开始）
			HSSFCell firstCell = firstRow.createCell(0);
			firstCell.setCellValue(date);
  
	          
	        HSSFRow row = null;  
	        HSSFCell cell = null;  
	        
	        row = sheet.createRow(1);
	        cell = row.createCell(0);
	        cell.setCellValue("条形码");
	        cell = row.createCell(1);
	        cell.setCellValue("名称");
	        cell = row.createCell(2);
	        cell.setCellValue("分类名称");
	        cell = row.createCell(3);
	        cell.setCellValue("库存");
	        cell = row.createCell(4);
	        cell.setCellValue("入库时间");
	      					
	        // 行号  
	        int rowIndex = 2;  
	        
	        for(int i=0; i<list.size(); i++){
	        	Instrument instrument = list.get(i);
	        	//列号清零
	        	int cellIndex = 0;
	        	// 通过sheet对象增加一行  
	        	row = sheet.createRow(rowIndex++);  
		        // 通过row对象增加一列  
		        cell = row.createCell(cellIndex++);  
		        // 设值列的内容  
		        cell.setCellValue(instrument.getBarcode());  
		        // 增加一列  
		        cell = row.createCell(cellIndex++);  
		        // 设值列的内容  
		        cell.setCellValue(instrument.getInstrumentname());
		        // 增加一列  
		        cell = row.createCell(cellIndex++);  
		        // 设值列的内容  
		        cell.setCellValue(instrument.getInstrumenttype());
		        // 增加一列  
		        cell = row.createCell(cellIndex++);  
		        // 设值列的内容  
		        cell.setCellValue(instrument.getCount());
		        // 增加一列  
		        cell = row.createCell(cellIndex++);  
		        // 设值列的内容  
		        cell.setCellValue(instrument.getDate());
	        }

		}
}
