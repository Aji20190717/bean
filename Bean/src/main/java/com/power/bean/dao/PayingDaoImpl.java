package com.power.bean.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.power.bean.dto.PayingDto;

@Repository
public class PayingDaoImpl implements PayingDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<PayingDto> selectPayingList() {
		
		List<PayingDto> payingList = sqlSession.selectList(PAYINGNAMESPACE + "selectPayingList");
		
		return payingList;
	}

	@Override
	public int insertPaying(PayingDto payingDto) {
		
		System.out.println(payingDto);
		int res = sqlSession.insert(PAYINGNAMESPACE + "insertPaying", payingDto);
		System.out.println(res);
		
		return res;
	}

	@Override
	public int refundPaying(int payment_no) {
		
		int res = sqlSession.insert(PAYINGNAMESPACE + "refundPaying");
		
		return res;
	}
	
	
}

