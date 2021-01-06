package com.power.bean.dto;

import java.util.Date;

public class CsDto {

	private int csno;
	private String cscategory;
	private String cstitle;
	private String csname;
	private String csconment;
	private Date csdate;

	public CsDto() {

	}

	public CsDto(int csno, String cscategory, String cstitle, String csname, String csconment, Date csdate) {
		super();
		this.csno = csno;
		this.cscategory = cscategory;
		this.cstitle = cstitle;
		this.csname = csname;
		this.csconment = csconment;
		this.csdate = csdate;
	}

	public int getCsno() {
		return csno;
	}

	public void setCsno(int csno) {
		this.csno = csno;
	}

	public String getCscategory() {
		return cscategory;
	}

	public void setCscategory(String cscategory) {
		this.cscategory = cscategory;
	}

	public String getCstitle() {
		return cstitle;
	}

	public void setCstitle(String cstitle) {
		this.cstitle = cstitle;
	}

	public String getCsname() {
		return csname;
	}

	public void setCsname(String csname) {
		this.csname = csname;
	}

	public String getCsconment() {
		return csconment;
	}

	public void setCsconment(String csconment) {
		this.csconment = csconment;
	}

	public Date getCsdate() {
		return csdate;
	}

	public void setCsdate(Date csdate) {
		this.csdate = csdate;
	}

}
