package com.power.bean.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.power.bean.dao.CsDao;
import com.power.bean.dto.CsDto;

@Service
public class CsBizImpl implements CsBiz {

	@Autowired
	private CsDao dao;

	@Override
	public List<CsDto> selectList() {
		return dao.selectList();
	}

	@Override
	public CsDto selectOne(int csno) {
		return dao.selectOne(csno);
	}

	@Override
	public int insert(CsDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(CsDto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(int csno) {
		return dao.delete(csno);
	}

}
