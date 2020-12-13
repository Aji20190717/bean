package com.power.bean.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class QuestionDto {
	
	private int questionboard_no;
	private int member_no;
	private String questionboard_name;
	private String questionboard_title;
	private String questionboard_content;
	private Date questionboard_date;
	private int questionboard_readcount;
	private int questionboard_step;
	private int questionboard_groupno;
	private String questionboard_reply;
	private Date questionboard_replydate;
	private String qestionboard_delflag;
	private String questionboard_imgname;
	private String questionboard_imgpath;
	private String questionboard_ocr;
	private MultipartFile question_mpfile;
	
	public QuestionDto() {
	}

	public QuestionDto(int questionboard_no, int member_no, String questionboard_name, String questionboard_title,
			String questionboard_content, Date questionboard_date, int questionboard_readcount, int questionboard_step,
			int questionboard_groupno, String questionboard_reply, Date quesetionboard_replydate,
			String qestionboard_delflag, String questionboard_imgname, String questionboard_imgpath,
			String questionboard_ocr) {
		this.questionboard_no = questionboard_no;
		this.member_no = member_no;
		this.questionboard_name = questionboard_name;
		this.questionboard_title = questionboard_title;
		this.questionboard_content = questionboard_content;
		this.questionboard_date = questionboard_date;
		this.questionboard_readcount = questionboard_readcount;
		this.questionboard_step = questionboard_step;
		this.questionboard_groupno = questionboard_groupno;
		this.questionboard_reply = questionboard_reply;
		this.questionboard_replydate = quesetionboard_replydate;
		this.qestionboard_delflag = qestionboard_delflag;
		this.questionboard_imgname = questionboard_imgname;
		this.questionboard_imgpath = questionboard_imgpath;
		this.questionboard_ocr = questionboard_ocr;
	}

	public QuestionDto(int questionboard_no, int member_no, String questionboard_name, String questionboard_title,
			String questionboard_content, Date questionboard_date, int questionboard_readcount, int questionboard_step,
			int questionboard_groupno, String questionboard_reply, Date quesetionboard_replydate,
			String qestionboard_delflag, String questionboard_imgname, String questionboard_imgpath,
			String questionboard_ocr, MultipartFile question_mpfile) {
		this.questionboard_no = questionboard_no;
		this.member_no = member_no;
		this.questionboard_name = questionboard_name;
		this.questionboard_title = questionboard_title;
		this.questionboard_content = questionboard_content;
		this.questionboard_date = questionboard_date;
		this.questionboard_readcount = questionboard_readcount;
		this.questionboard_step = questionboard_step;
		this.questionboard_groupno = questionboard_groupno;
		this.questionboard_reply = questionboard_reply;
		this.questionboard_replydate = quesetionboard_replydate;
		this.qestionboard_delflag = qestionboard_delflag;
		this.questionboard_imgname = questionboard_imgname;
		this.questionboard_imgpath = questionboard_imgpath;
		this.questionboard_ocr = questionboard_ocr;
		this.question_mpfile = question_mpfile;
	}



	public int getQuestionboard_no() {
		return questionboard_no;
	}

	public void setQuestionboard_no(int questionboard_no) {
		this.questionboard_no = questionboard_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getQuestionboard_name() {
		return questionboard_name;
	}

	public void setQuestionboard_name(String questionboard_name) {
		this.questionboard_name = questionboard_name;
	}

	public String getQuestionboard_title() {
		return questionboard_title;
	}

	public void setQuestionboard_title(String questionboard_title) {
		this.questionboard_title = questionboard_title;
	}

	public String getQuestionboard_content() {
		return questionboard_content;
	}

	public void setQuestionboard_content(String questionboard_content) {
		this.questionboard_content = questionboard_content;
	}

	public Date getQuestionboard_date() {
		return questionboard_date;
	}

	public void setQuestionboard_date(Date questionboard_date) {
		this.questionboard_date = questionboard_date;
	}

	public int getQuestionboard_readcount() {
		return questionboard_readcount;
	}

	public void setQuestionboard_readcount(int questionboard_readcount) {
		this.questionboard_readcount = questionboard_readcount;
	}

	public int getQuestionboard_step() {
		return questionboard_step;
	}

	public void setQuestionboard_step(int questionboard_step) {
		this.questionboard_step = questionboard_step;
	}

	public String getQuestionboard_reply() {
		return questionboard_reply;
	}

	public void setQuestionboard_reply(String questionboard_reply) {
		this.questionboard_reply = questionboard_reply;
	}

	public int getQuestionboard_groupno() {
		return questionboard_groupno;
	}

	public void setQuestionboard_groupno(int questionboard_groupno) {
		this.questionboard_groupno = questionboard_groupno;
	}

	public String getQuestionboard_imgname() {
		return questionboard_imgname;
	}

	public void setQuestionboard_imgname(String questionboard_imgname) {
		this.questionboard_imgname = questionboard_imgname;
	}

	public String getQuestionboard_imgpath() {
		return questionboard_imgpath;
	}

	public void setQuestionboard_imgpath(String questionboard_imgpath) {
		this.questionboard_imgpath = questionboard_imgpath;
	}

	public String getQuestionboard_ocr() {
		return questionboard_ocr;
	}

	public void setQuestionboard_ocr(String questionboard_ocr) {
		this.questionboard_ocr = questionboard_ocr;
	}

	public MultipartFile getQuestion_mpfile() {
		return question_mpfile;
	}

	public void setQuestion_mpfile(MultipartFile question_mpfile) {
		this.question_mpfile = question_mpfile;
	}

	public Date getQuesetionboard_replydate() {
		return questionboard_replydate;
	}

	public void setQuesetionboard_replydate(Date quesetionboard_replydate) {
		this.questionboard_replydate = quesetionboard_replydate;
	}

	public String getQestionboard_delflag() {
		return qestionboard_delflag;
	}

	public void setQestionboard_delflag(String qestionboard_delflag) {
		this.qestionboard_delflag = qestionboard_delflag;
	}

	
	

}
