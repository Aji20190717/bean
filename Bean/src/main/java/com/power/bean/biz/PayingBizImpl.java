package com.power.bean.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.power.bean.dao.PayingDao;
import com.power.bean.dto.PayingDto;

@Service
public class PayingBizImpl implements PayingBiz{
	
	@Autowired
	private PayingDao payingDao;

	@Override
	public List<PayingDto> selectPayingList() {
		
		return payingDao.selectPayingList();
	}

	@Override
	public int insertPaying(PayingDto payingDto) {
		
		return payingDao.insertPaying(payingDto);
	}

	//TODO : Iamport refund 처리
	@Override
	public int refundPaying(int payment_no) {
		
		return payingDao.refundPaying(payment_no);
	}
	
	
	
	
}
