package com.power.bean.util;

import org.springframework.web.multipart.MultipartFile;

public class QuestionUploadFile {

	private String name;
	private String desc;
	private MultipartFile mpfile;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public MultipartFile getMpfile() {
		return mpfile;
	}
	public void setMpfile(MultipartFile mpfile) {
		this.mpfile = mpfile;
	}
}
