package com.power.bean.dao;

import java.util.List;

import com.power.bean.dto.PayingDto;

public interface PayingDao {
	
	String PAYINGNAMESPACE = "paying.";
	
	public List<PayingDto> selectPayingList();
	public int insertPaying(PayingDto payingDto);
	public int refundPaying(int payment_no);
	
}
