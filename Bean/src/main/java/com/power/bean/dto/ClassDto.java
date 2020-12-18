package com.power.bean.dto;

import java.util.Date;

public class ClassDto {
	
	//TODO : class 마다 가격 어떻게 할 것인지 고민
	private int class_no;
	private int member_no;
	private int class_max;
	private int class_now;
	private Date class_startDate;
	private Date class_endDate;
	private String class_name;
	private String class_memberName;
	private String class_delflag;
	
	public ClassDto() {
		
	}

	public ClassDto(int class_no, int member_no, int class_max, int class_now, Date class_startDate, Date class_endDate,
			String class_name, String class_memberName, String class_delflag) {
		this.class_no = class_no;
		this.member_no = member_no;
		this.class_max = class_max;
		this.class_now = class_now;
		this.class_startDate = class_startDate;
		this.class_endDate = class_endDate;
		this.class_name = class_name;
		this.class_memberName = class_memberName;
		this.class_delflag = class_delflag;
	}

	public int getClass_no() {
		return class_no;
	}

	public void setClass_no(int class_no) {
		this.class_no = class_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public int getClass_max() {
		return class_max;
	}

	public void setClass_max(int class_max) {
		this.class_max = class_max;
	}

	public int getClass_now() {
		return class_now;
	}

	public void setClass_now(int class_now) {
		this.class_now = class_now;
	}

	public Date getClass_startDate() {
		return class_startDate;
	}

	public void setClass_startDate(Date class_startDate) {
		this.class_startDate = class_startDate;
	}

	public Date getClasS_endDate() {
		return class_endDate;
	}

	public void setClasS_endDate(Date clasS_endDate) {
		this.class_endDate = clasS_endDate;
	}

	public String getClass_name() {
		return class_name;
	}

	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}

	public String getClass_memberName() {
		return class_memberName;
	}

	public void setClass_memberName(String class_memberName) {
		this.class_memberName = class_memberName;
	}

	public String getClass_delflag() {
		return class_delflag;
	}

	public void setClass_delflag(String class_delflag) {
		this.class_delflag = class_delflag;
	}

	@Override
	public String toString() {
		return "ClassDto [class_no=" + class_no + ", member_no=" + member_no + ", class_max=" + class_max
				+ ", class_now=" + class_now + ", class_startDate=" + class_startDate + ", class_endDate="
				+ class_endDate + ", class_name=" + class_name + ", class_memberName=" + class_memberName
				+ ", class_delflag=" + class_delflag + "]";
	}
	
	
	
	
	
	
		
	
}
