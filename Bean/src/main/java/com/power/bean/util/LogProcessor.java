package com.power.bean.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class LogProcessor {


	//주기적으로 실행하는 프로세스
	public void process() {
		
		Calendar nowTime = Calendar.getInstance();
		SimpleDateFormat simpledate = new SimpleDateFormat("[yyyy-MM-dd:mm:ss]");
		String strNowTime = simpledate.format(nowTime.getTime());
		
		System.out.println(strNowTime + "로그 출력!");
		
		
	
	}
}
