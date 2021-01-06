package com.power.bean.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.power.bean.dto.CsDto;

@Repository
public class CsDaoImpl implements CsDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<CsDto> selectList() {

		List<CsDto> csboardList = new ArrayList<CsDto>();

		try {
			csboardList = sqlSession.selectList(NAMESPACE + "selectList");
		} catch (Exception e) {
			System.out.println("Error selectList");
			e.printStackTrace();
		}

		return csboardList;
	}

	@Override
	public CsDto selectOne(int csno) {

		CsDto cto = null;

		try {
			cto = sqlSession.selectOne(NAMESPACE + "selectOne", csno);
		} catch (Exception e) {
			System.out.println("Error SelectOne");
			e.printStackTrace();
		}

		return cto;
	}

	@Override
	public int insert(CsDto dto) {

		int res = 0;

		try {
			res = sqlSession.insert(NAMESPACE + "insert", dto);
		} catch (Exception e) {
			System.out.println("INSERT ERROR");
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int update(CsDto dto) {

		int res = 0;

		try {
			res = sqlSession.update(NAMESPACE + "update", dto);
		} catch (Exception e) {
			System.out.println("UPDATE ERROR");
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public int delete(int csno) {

		int res = 0;

		try {
			res = sqlSession.delete(NAMESPACE + "delete", csno);
		} catch (Exception e) {
			System.out.println("DELETE ERROR");
			e.printStackTrace();
		}
		return res;
	}

}
