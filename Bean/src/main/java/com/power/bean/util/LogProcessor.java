package com.power.bean.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import com.power.bean.dao.QuartzClassDao;

public class LogProcessor {
	
	private QuartzClassDao quartzClassdao;
	
	public void setQuartzClassdao(QuartzClassDao quartzClassdao) {
		this.quartzClassdao = quartzClassdao;
	}

	public void process() {
		
		Calendar nowTime = Calendar.getInstance();
		SimpleDateFormat simpledate = new SimpleDateFormat("[yyyy-MM-dd:mm:ss]");
		String strNowTime = simpledate.format(nowTime.getTime());
		
		System.out.println(strNowTime + ": logprocessor Running");
	
	}
	
	public void sqlProcess() {
		
		System.out.println(quartzClassdao.selectClassList());
		
	}
	
}
