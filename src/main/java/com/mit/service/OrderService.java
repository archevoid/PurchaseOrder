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
	
	
	public List<CompanyDTO> getCompany() {
		return orderDao.getCompany();
	}
	
	public List<OrderDTO> getOrderByMonth(Date date) {
		return orderDao.getOrderByMonth(date);
	}
}
