package com.nguyentuan.Exprot;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.Document;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.nguyentuan.entity.UserTimeOut;

public class ItextPdfView extends AbstractITextPdfView {

	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document document, PdfWriter writer,
			HttpServletRequest request, HttpServletResponse response) throws Exception {

		@SuppressWarnings("unchecked")
		List<UserTimeOut> list = (List<UserTimeOut>) model.get("UserTimeOutList");

		PdfPTable table = new PdfPTable(6);

		table.addCell("ID");
		table.addCell("UserName");
		table.addCell("Department");
		table.addCell("Create");
		table.addCell("Destiones");
		table.addCell("Manager");
		for (UserTimeOut user : list) {
			table.addCell(String.valueOf(user.getID()));
			table.addCell(user.getDeptID().getName());
			table.addCell(user.getUserID().getFullName());
			table.addCell(user.getCreated());
			table.addCell(user.getDescriptions());

			if (user.getManagerApproval() != null) {

				table.addCell(user.getManagerApproval().getName());
			} else {
				table.addCell("chua phe duyet");

			}

		}

		document.add(table);
	}
}