package com.power.bean.dao;

import com.power.bean.dto.LoginDto;

public interface MemberDao {

	String NAMESPACE = "member.";
	
	// 로그아웃은 버튼을 누르면 session에서 정보를 삭제하는 것으로 한다.
	// 개인 정보 조회는 session에 담긴 정보를 사용한다.
	// 개인 정보 수정
	public int myinfoupdate(LoginDto dto);

	// 회원 탈퇴
	public int withdrawal(int member_no);

}
