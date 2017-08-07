package com.nguyentuan.Exprot;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.view.document.AbstractXlsView;

import com.nguyentuan.entity.UserTimeOut;


import model.User1;



public class ExcelUserListReportView extends AbstractXlsView {

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		
		response.setHeader("Content-Disposition", "attachment: filename=\"user_listxls\"");
		@SuppressWarnings("unchecked")
		List<UserTimeOut> list =(List<UserTimeOut>) model.get("UserTimeOutList");
		
		
		Sheet sheet = workbook.createSheet("UserTimeOut");
		
		// header row
		Row header = sheet.createRow(0);
		header.createCell(0).setCellValue("ID");
		header.createCell(1).setCellValue("UserName");
		header.createCell(2).setCellValue("Department");
		header.createCell(3).setCellValue("Create");
		header.createCell(4).setCellValue("Destiones");
		header.createCell(5).setCellValue("Manager");
		int rowNum = 1;
		for(UserTimeOut user : list){
			Row row = sheet.createRow(rowNum++);
			row.createCell(0).setCellValue(user.getID());
			row.createCell(1).setCellValue(user.getUserID().getFullName());			
			row.createCell(2).setCellValue(user.getDeptID().getName());			
			row.createCell(3).setCellValue(user.getCreated());
			row.createCell(4).setCellValue(user.getDescriptions());
			
			if(user.getManagerApproval() != null){
				
				row.createCell(5).setCellValue(user.getManagerApproval().getFullName());
			}else{
				row.createCell(5).setCellValue("Chua ph duyet");
				
			}
			
			
		}
		
		
	}

}
