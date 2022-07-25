package com.mit.service;

import java.sql.Date;
import java.util.List;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.annotation.Resource;
import javax.mail.Multipart;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itextpdf.text.zugferd.checkers.basic.LanguageCode;
import com.mit.model.CompanyDTO;
import com.mit.model.OrderDAO;
import com.mit.model.OrderDTO;

@Service
public class OrderService extends NEmailService {
	
	@Autowired
	OrderDAO orderDao;
	
	@Resource(name = "FROM_ORDER")
	private String FROM;
	
	@Resource(name = "FROM_NAME_ORDER")
	private String FROM_NAME;
	
	public void superMaker() {
		super.FROM = this.FROM;
		super.FROM_NAME = this.FROM_NAME;
	}
	
	public List<OrderDTO> getOrder(OrderDTO orderDto) {
		return orderDao.getOrder(orderDto);
	}
	
	public Long countOrder(OrderDTO orderDto) {
		return orderDao.countOrder(orderDto);
	}
	
	public List<OrderDTO> getAllPart() {
		return orderDao.getAllPart();
	}
	
	public List<OrderDTO> getAllCompany() {
		return orderDao.getAllCompany();
	}
	
	public OrderDTO getResetOrderData(OrderDTO orderDto) {
		return orderDao.getResetOrderData(orderDto);
	}
	
	public Integer updateOrder(OrderDTO orderDto) {
		return orderDao.updateOrder(orderDto);
	}
	
	public Long countProgress(OrderDTO orderDto) {
		return orderDao.countOrder(orderDto);
	}
	
	public List<CompanyDTO> getCompany() {
		return orderDao.getCompany();
	}
	
	public List<OrderDTO> getOrderByMonth(Date date) {
		return orderDao.getOrderByMonth(date);
	}
	
	public List<OrderDTO> getOrderInfo(OrderDTO orderDto) {
		return orderDao.getOrderInfo(orderDto);
	}
	
	public List<OrderDTO> searchOrderProgress(OrderDTO orderDto) {
		return orderDao.searchOrderProgress(orderDto);
	}
	
	public Integer updatePublished(OrderDTO orderDto) {
		return orderDao.updatePublished(orderDto);
	}
	
	public String getOrderNum(OrderDTO orderDto) {
		return orderDao.getOrderNum(orderDto).getOrderNum();
	}
	
	public CompanyDTO getOurCompany() {
		return orderDao.getOurCompany();
	}
	
	public OrderDTO getScheduleInfo(OrderDTO orderDto) {
		return orderDao.getScheduleInfo(orderDto);
	}
	
	public void sendOrder(String emailContent, String[] addressList, FileDataSource fds) throws Exception {
		superMaker();
		
		MimeMessage message = makeMessage(addressList, "발주서입니다.");
		
		Multipart mp = new MimeMultipart();
		
		MimeBodyPart mbp0 = new MimeBodyPart();
		mbp0.setContent(emailContent, "text/html;charset=utf-8");
		
		mp.addBodyPart(mbp0);
		
		if (fds != null) {
			MimeBodyPart mbp = new MimeBodyPart();
			
			mbp.setDataHandler(new DataHandler(fds));
			
			mbp.setFileName(fds.getName());
			
			mp.addBodyPart(mbp);
		}
		
		message.setContent(mp);
		
		sendMail(message);
	}
}
