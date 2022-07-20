package com.mit.service;

import java.sql.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	public String getPaperNum(OrderDTO orderDto) {
		return orderDao.getPaperNum(orderDto).getPaperNum();
	}
	
	public CompanyDTO getOurCompany() {
		return orderDao.getOurCompany();
	}
	
	public void sendOrder(String elem, String to) throws Exception {
		superMaker();
		
		elem = "<html><body style='font-family: MALGUNGothic;'>" + elem + "</body></html>";
		
		MimeMessage message = makeMessage("jicmu@jicmu.org", "발주서입니다.");
		
		message.setHeader("Content-Type", "text/html;charset=utf-8");
		
		message.setContent(elem, "text/html;charset=utf-8");
		
		sendMail(message);
	}
}
