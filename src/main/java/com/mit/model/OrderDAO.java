package com.mit.model;

import java.sql.Date;
import java.util.List;

public interface OrderDAO {
	List<CompanyDTO> getCompany();
	
	List<OrderDTO> getOrderByMonth(Date date);
}
