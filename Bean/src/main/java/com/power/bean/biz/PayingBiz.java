package com.power.bean.biz;

import java.util.List;

import com.power.bean.dto.PayingDto;

public interface PayingBiz {
	
	public List<PayingDto> selectPayingList();
	public int insertPaying(PayingDto payingDto);
	public int refundPaying(int payment_no);
	
}
