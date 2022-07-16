package com.mit.service;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import com.mit.model.CompanyDTO;
import com.mit.model.OrderDAO;
import com.mit.model.OrderDTO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class OrderService extends com.mit.service.Service {
	
	OrderDAO orderDao;
	
	
	public List<OrderDTO> getOrder(OrderDTO orderDto) {
		return orderDao.getOrder(orderDto);
	}
	
	public Long countOrder(OrderDTO orderDto) {
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
}
