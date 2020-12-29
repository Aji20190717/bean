package com.power.bean.dto;

import java.util.Date;

public class PayingDto {
	
	private int payment_no;
	private int member_no;
	private int class_no;
	private String payment_method;
	private String payment_price;
	private String payment_state;
	private Date payment_date;
	private String payment_impuid;
	private String payment_refund;
	
	public PayingDto() {
		
	}

	public PayingDto(int payment_no, int member_no, int class_no, String payment_method, String payment_price,
			String payment_state, Date payment_date, String payment_impuid, String payment_refund) {
		this.payment_no = payment_no;
		this.member_no = member_no;
		this.class_no = class_no;
		this.payment_method = payment_method;
		this.payment_price = payment_price;
		this.payment_state = payment_state;
		this.payment_date = payment_date;
		this.payment_impuid = payment_impuid;
		this.payment_refund = payment_refund;
	}

	public int getPayment_no() {
		return payment_no;
	}

	public void setPayment_no(int payment_no) {
		this.payment_no = payment_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public int getClass_no() {
		return class_no;
	}

	public void setClass_no(int class_no) {
		this.class_no = class_no;
	}

	public String getPayment_method() {
		return payment_method;
	}

	public void setPayment_method(String payment_method) {
		this.payment_method = payment_method;
	}

	public String getPayment_price() {
		return payment_price;
	}

	public void setPayment_price(String payment_price) {
		this.payment_price = payment_price;
	}

	public String getPayment_state() {
		return payment_state;
	}

	public void setPayment_state(String payment_state) {
		this.payment_state = payment_state;
	}

	public Date getPayment_date() {
		return payment_date;
	}

	public void setPayment_date(Date payment_date) {
		this.payment_date = payment_date;
	}

	public String getPayment_impuid() {
		return payment_impuid;
	}

	public void setPayment_impuid(String payment_impuid) {
		this.payment_impuid = payment_impuid;
	}

	public String getPayment_refund() {
		return payment_refund;
	}

	public void setPayment_refund(String payment_refund) {
		this.payment_refund = payment_refund;
	}

	@Override
	public String toString() {
		return "PayingDto [payment_no=" + payment_no + ", member_no=" + member_no + ", class_no=" + class_no
				+ ", payment_method=" + payment_method + ", payment_price=" + payment_price + ", payment_state="
				+ payment_state + ", payment_date=" + payment_date + ", payment_impuid=" + payment_impuid
				+ ", payment_refund=" + payment_refund + "]";
	}
}
