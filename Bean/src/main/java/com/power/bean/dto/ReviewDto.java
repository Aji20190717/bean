package com.power.bean.dto;

import java.sql.Date;

public class ReviewDto {
	
	private int reviewboard_no;
	private int member_no;
	private String reviewboard_name;
	private String reviewboard_title;
	private String reviewboard_content;
	private Date reviewboard_date;
	private int reviewboard_readcount;
	private String reviewboard_delflag;
	private String class_name;
	private String reviewboard_te;
	private int reviewboard_star;
	public int getReviewboard_no() {
		return reviewboard_no;
	}
	public void setReviewboard_no(int reviewboard_no) {
		this.reviewboard_no = reviewboard_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getReviewboard_name() {
		return reviewboard_name;
	}
	public void setReviewboard_name(String reviewboard_name) {
		this.reviewboard_name = reviewboard_name;
	}
	public String getReviewboard_title() {
		return reviewboard_title;
	}
	public void setReviewboard_title(String reviewboard_title) {
		this.reviewboard_title = reviewboard_title;
	}
	public String getReviewboard_content() {
		return reviewboard_content;
	}
	public void setReviewboard_content(String reviewboard_content) {
		this.reviewboard_content = reviewboard_content;
	}
	public Date getReviewboard_date() {
		return reviewboard_date;
	}
	public void setReviewboard_date(Date reviewboard_date) {
		this.reviewboard_date = reviewboard_date;
	}
	public int getReviewboard_readcount() {
		return reviewboard_readcount;
	}
	public void setReviewboard_readcount(int reviewboard_readcount) {
		this.reviewboard_readcount = reviewboard_readcount;
	}
	public String getReviewboard_delflag() {
		return reviewboard_delflag;
	}
	public void setReviewboard_delflag(String reviewboard_delflag) {
		this.reviewboard_delflag = reviewboard_delflag;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public String getReviewboard_te() {
		return reviewboard_te;
	}
	public void setReviewboard_te(String reviewboard_te) {
		this.reviewboard_te = reviewboard_te;
	}
	public int getReviewboard_star() {
		return reviewboard_star;
	}
	public void setReviewboard_star(int reviewboard_star) {
		this.reviewboard_star = reviewboard_star;
	}
	@Override
	public String toString() {
		return "ReviewDto [reviewboard_no=" + reviewboard_no + ", member_no=" + member_no + ", reviewboard_name="
				+ reviewboard_name + ", reviewboard_title=" + reviewboard_title + ", reviewboard_content="
				+ reviewboard_content + ", reviewboard_date=" + reviewboard_date + ", reviewboard_readcount="
				+ reviewboard_readcount + ", reviewboard_delflag=" + reviewboard_delflag + ", class_name=" + class_name
				+ ", reviewboard_te=" + reviewboard_te + ", reviewboard_star=" + reviewboard_star + "]";
	}
	public ReviewDto(int reviewboard_no, int member_no, String reviewboard_name, String reviewboard_title,
			String reviewboard_content, Date reviewboard_date, int reviewboard_readcount, String reviewboard_delflag,
			String class_name, String reviewboard_te, int reviewboard_star) {
		super();
		this.reviewboard_no = reviewboard_no;
		this.member_no = member_no;
		this.reviewboard_name = reviewboard_name;
		this.reviewboard_title = reviewboard_title;
		this.reviewboard_content = reviewboard_content;
		this.reviewboard_date = reviewboard_date;
		this.reviewboard_readcount = reviewboard_readcount;
		this.reviewboard_delflag = reviewboard_delflag;
		this.class_name = class_name;
		this.reviewboard_te = reviewboard_te;
		this.reviewboard_star = reviewboard_star;
	}
	public ReviewDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
}
/*

개인번호로...클래스에접근해...?
음...
클래스에 선생님번호랑 학생번호가 있는데 리스트로 담을거야 4개정도 들어가게
그럼 내가 학생이야 내 번호가 있으니까 클래스테입레 값을 가져올때 학생번호에있는 번호를 가져와서 리스트로 가져와?
이걸다 검색해?
안되?
셀렉트할때 원할때 조건을 넣잖아요 조건을 이 안에 학생값을 넣으면 되요...?
셀렉트 원할때 값을 넣어.......값으로 나온 DTO들을 가져와...리스트로되어있어...




=======
package com.power.bean.dto;

import java.sql.Date;

public class ReviewDto {
	
	private int reviewboard_no;
	private int member_no;
	private String reviewboard_name;
	private String reviewboard_title;
	private String reviewboard_content;
	private Date reviewboard_date;
	private int reviewboard_readcount;
	private String reviewboard_delflag;
	private String class_name;
	private String reviewboard_te;
	private int reviewboard_star;
	
	private String review_search;
	
	public String getReview_search() {
		return review_search;
	}
	public void setReview_search(String review_search) {
		this.review_search=review_search;
	}
	
	
	public int getReviewboard_no() {
		return reviewboard_no;
	}
	public void setReviewboard_no(int reviewboard_no) {
		this.reviewboard_no = reviewboard_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getReviewboard_name() {
		return reviewboard_name;
	}
	public void setReviewboard_name(String reviewboard_name) {
		this.reviewboard_name = reviewboard_name;
	}
	public String getReviewboard_title() {
		return reviewboard_title;
	}
	public void setReviewboard_title(String reviewboard_title) {
		this.reviewboard_title = reviewboard_title;
	}
	public String getReviewboard_content() {
		return reviewboard_content;
	}
	public void setReviewboard_content(String reviewboard_content) {
		this.reviewboard_content = reviewboard_content;
	}
	public Date getReviewboard_date() {
		return reviewboard_date;
	}
	public void setReviewboard_date(Date reviewboard_date) {
		this.reviewboard_date = reviewboard_date;
	}
	public int getReviewboard_readcount() {
		return reviewboard_readcount;
	}
	public void setReviewboard_readcount(int reviewboard_readcount) {
		this.reviewboard_readcount = reviewboard_readcount;
	}
	public String getReviewboard_delflag() {
		return reviewboard_delflag;
	}
	public void setReviewboard_delflag(String reviewboard_delflag) {
		this.reviewboard_delflag = reviewboard_delflag;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public String getReviewboard_te() {
		return reviewboard_te;
	}
	public void setReviewboard_te(String reviewboard_te) {
		this.reviewboard_te = reviewboard_te;
	}
	public int getReviewboard_star() {
		return reviewboard_star;
	}
	public void setReviewboard_star(int reviewboard_star) {
		this.reviewboard_star = reviewboard_star;
	}
	@Override
	public String toString() {
		return "ReviewDto [reviewboard_no=" + reviewboard_no + ", member_no=" + member_no + ", reviewboard_name="
				+ reviewboard_name + ", reviewboard_title=" + reviewboard_title + ", reviewboard_content="
				+ reviewboard_content + ", reviewboard_date=" + reviewboard_date + ", reviewboard_readcount="
				+ reviewboard_readcount + ", reviewboard_delflag=" + reviewboard_delflag + ", class_name=" + class_name
				+ ", reviewboard_te=" + reviewboard_te + ", reviewboard_star=" + reviewboard_star + "]";
	}
	public ReviewDto(int reviewboard_no, int member_no, String reviewboard_name, String reviewboard_title,
			String reviewboard_content, Date reviewboard_date, int reviewboard_readcount, String reviewboard_delflag,
			String class_name, String reviewboard_te, int reviewboard_star) {
		super();
		this.reviewboard_no = reviewboard_no;
		this.member_no = member_no;
		this.reviewboard_name = reviewboard_name;
		this.reviewboard_title = reviewboard_title;
		this.reviewboard_content = reviewboard_content;
		this.reviewboard_date = reviewboard_date;
		this.reviewboard_readcount = reviewboard_readcount;
		this.reviewboard_delflag = reviewboard_delflag;
		this.class_name = class_name;
		this.reviewboard_te = reviewboard_te;
		this.reviewboard_star = reviewboard_star;
	}
	public ReviewDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
}
/*

개인번호로...클래스에접근해...?
음...
클래스에 선생님번호랑 학생번호가 있는데 리스트로 담을거야 4개정도 들어가게
그럼 내가 학생이야 내 번호가 있으니까 클래스테입레 값을 가져올때 학생번호에있는 번호를 가져와서 리스트로 가져와?
이걸다 검색해?
안되?
셀렉트할때 원할때 조건을 넣잖아요 조건을 이 안에 학생값을 넣으면 되요...?
셀렉트 원할때 값을 넣어.......값으로 나온 DTO들을 가져와...리스트로되어있어...




>>>>>>> 672dbff27244eafc9ccd9c6bcf4f8f3b31f884fa
*/