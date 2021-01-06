package com.power.bean.biz;

import java.util.List;

import com.power.bean.dto.CsDto;

public interface CsBiz {

	public List<CsDto> selectList();

	public CsDto selectOne(int csno);

	public int insert(CsDto dto);

	public int update(CsDto dto);

	public int delete(int csno);

}
