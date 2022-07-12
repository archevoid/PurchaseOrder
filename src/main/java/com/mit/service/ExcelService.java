package com.mit.service;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;

@Service
public class ExcelService extends com.mit.service.Service {
	public <T> Workbook makeWorkBook(String sheetName, HashMap<String, T> data, String[] header, String[] order)
			throws IllegalAccessException, IllegalArgumentException, InvocationTargetException, ClassNotFoundException {

		if (data.size() == 0) {
			return null;
		}

		XSSFWorkbook result = new XSSFWorkbook();

		Set<String> keySet = data.keySet();

		String[] keys = new String[keySet.size()];

		Iterator<String> itr = keySet.iterator();

		int index = 0;
		do {
			keys[index] = itr.next();
		} while (itr.hasNext());

		XSSFSheet sheet = result.createSheet(sheetName);

		int rowNum = 0;

		Row hRow = sheet.createRow(rowNum++);

		for (int i = 0; i < header.length; i++) {
			Cell hCell = hRow.createCell(i);

			hCell.setCellValue(header[i]);
		}

		Class<?> clz = Class.forName(data.get(keys[0]).getClass().getName());

		Method[] m = clz.getDeclaredMethods();

		for (String key : keySet) {

			XSSFRow row = sheet.createRow(rowNum++);

			int cellNum = 0;

			for (int j = 0; j < order.length; j++) {
				for (int i = 0; i < m.length; i++) {
					String mName = m[i].getName().replaceAll("get", "");

					if (mName.equalsIgnoreCase(order[j])) {
						XSSFCell cell = row.createCell(cellNum++);
						
						Object tmp = m[i].invoke(data.get(key));

						if (tmp instanceof String) {
							cell.setCellValue((String) tmp);
						} else if (tmp instanceof Integer) {
							cell.setCellValue((Integer) tmp);
						} else if (tmp instanceof Long) {
							cell.setCellValue((Long) tmp);
						} else if (tmp instanceof Byte) {
							cell.setCellValue((Byte) tmp);
						} else if (tmp instanceof Short) {
							cell.setCellValue((Short) tmp);
						} else if (tmp instanceof Date) {
							cell.setCellValue(((Date)tmp).toString());
						} else {
							cell.setBlank();
						}
					}
				}
			}
		}

		return result;
	}
}
