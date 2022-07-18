package com.mit.model;

import java.sql.Date;
import java.util.List;

public interface OrderDAO {
	List<OrderDTO> getOrder(OrderDTO orderDto);
	
	Long countOrder(OrderDTO orderDto);
	
	Integer updatePublished(OrderDTO orderDto);
	
	List<OrderDTO> getAllPart();
	
	List<OrderDTO> getAllCompany();
	
	
	List<CompanyDTO> getCompany();
	
	List<OrderDTO> getOrderByMonth(Date date);
	
	List<OrderDTO> getOrderInfo(OrderDTO orderDto);
	
	List<OrderDTO> searchOrderProgress(OrderDTO orderDto);
}
