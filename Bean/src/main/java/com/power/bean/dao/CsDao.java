package com.power.bean.dao;

import java.util.List;

import com.power.bean.dto.CsDto;

public interface CsDao {

	String NAMESPACE = "com.csboard.";

	public List<CsDto> selectList();

	public CsDto selectOne(int csno);

	public int insert(CsDto dto);

	public int update(CsDto dto);

	public int delete(int csno);

}
