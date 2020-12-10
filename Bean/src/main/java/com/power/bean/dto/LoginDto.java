package com.power.bean.dto;

import org.springframework.web.multipart.MultipartFile;

public class LoginDto {
	
	private int member_no;
	private String member_id;
	private String member_pw;
	private String member_pwchk;
	private String member_name;
	private String member_email;
	private String member_phone;
	private int member_post;
	private String member_addr1;
	private String member_addr2;
	private String member_birth;
	private MultipartFile member_mpfile;
	private String member_imgname;
	private String member_imgpath;
	private String member_type;
	private String member_withdrawal;
	private String member_sns;
	
	public LoginDto() {
	}
	
	public LoginDto(int member_no, String member_id, String member_pw, String member_pwchk, String member_name,
			String member_email, String member_phone, int member_post, String member_addr1, String member_addr2,
			String member_birth, MultipartFile member_mpfile, String member_imgname, String member_imgpath,
			String member_type, String member_withdrawal, String member_sns) {
		super();
		this.member_no = member_no;
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_pwchk = member_pwchk;
		this.member_name = member_name;
		this.member_email = member_email;
		this.member_phone = member_phone;
		this.member_post = member_post;
		this.member_addr1 = member_addr1;
		this.member_addr2 = member_addr2;
		this.member_birth = member_birth;
		this.member_mpfile = member_mpfile;
		this.member_imgname = member_imgname;
		this.member_imgpath = member_imgpath;
		this.member_type = member_type;
		this.member_withdrawal = member_withdrawal;
		this.member_sns = member_sns;
	}

	public MultipartFile getMember_mpfile() {
		return member_mpfile;
	}

	public void setMember_mpfile(MultipartFile member_mpfile) {
		this.member_mpfile = member_mpfile;
	}
	
	public int getMember_no() {
		return member_no;
	}
	
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	
	public String getMember_id() {
		return member_id;
	}
	
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	public String getMember_pw() {
		return member_pw;
	}
	
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	
	public String getMember_pwchk() {
		return member_pwchk;
	}
	
	public void setMember_pwchk(String member_pwchk) {
		this.member_pwchk = member_pwchk;
	}
	
	public String getMember_name() {
		return member_name;
	}
	
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	
	public String getMember_email() {
		return member_email;
	}
	
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	
	public String getMember_phone() {
		return member_phone;
	}
	
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	
	public int getMember_post() {
		return member_post;
	}
	
	public void setMember_post(int member_post) {
		this.member_post = member_post;
	}
	
	public String getMember_addr1() {
		return member_addr1;
	}
	
	public void setMember_addr1(String member_addr1) {
		this.member_addr1 = member_addr1;
	}
	
	public String getMember_addr2() {
		return member_addr2;
	}
	
	public void setMember_addr2(String member_addr2) {
		this.member_addr2 = member_addr2;
	}
	
	public String getMember_birth() {
		return member_birth;
	}
	
	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
	}
	
	public String getMember_imgname() {
		return member_imgname;
	}
	
	public void setMember_imgname(String member_imgname) {
		this.member_imgname = member_imgname;
	}
	
	public String getMember_imgpath() {
		return member_imgpath;
	}
	
	public void setMember_imgpath(String member_imgpath) {
		this.member_imgpath = member_imgpath;
	}
	
	public String getMember_type() {
		return member_type;
	}
	
	public void setMember_type(String member_type) {
		this.member_type = member_type;
	}
	
	public String getMember_withdrawal() {
		return member_withdrawal;
	}
	
	public void setMember_withdrawal(String member_withdrawal) {
		this.member_withdrawal = member_withdrawal;
	}
	
	public String getMember_sns() {
		return member_sns;
	}
	
	public void setMember_sns(String member_sns) {
		this.member_sns = member_sns;
	}
	
}
