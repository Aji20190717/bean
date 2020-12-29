package com.power.bean.util;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.power.bean.dao.QuartzClassDao;
import com.power.bean.dto.ClassDto;
import com.power.bean.dto.LoginDto;

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
	
	public void classFinProcess() {
		
		//날짜가 지난 수업의 상태를 F로 바꿈
		int res = quartzClassdao.classListFin();
		
	}
	
	//수업이 종료된 학생들에게 메일을 전송
	public void mailProcess() {
	
		List<String> finstudentList = quartzClassdao.FinStudentList();
		System.out.println(finstudentList);
		List<String> finClassStudentInformList = quartzClassdao.classFinStudentClassInform(finstudentList);
		
		
		System.out.println(finClassStudentInformList);
		
		List<String> classFinStudentClassInformList = new ArrayList<String>();
		JSONParser parser = new JSONParser();
		for (String informString : classFinStudentClassInformList) {

			String jsonString = "{" + informString + "}";
			Object obj;
			
			try {
				obj = parser.parse(jsonString);
				JSONObject jsonObj = (JSONObject) obj;
				Iterator keyIterator = jsonObj.keySet().iterator();
				
				while(keyIterator.hasNext()) {
					
					//email 번호, className 을 얻음
					//String email = keyIterator.next().toString();
					//String className = (String) jsonObj.get(email);
					
					//sample
					String email = "qodbwls70@naver.com";
					String className = "qclass";
					
					//TODO : 메일 전송 코드를 추가할 것
					//TODO : Log 빈도 바꿀 것
					
					
				}
				
			} catch (ParseException e) {
				e.printStackTrace();
			}

		}
	}
	
}
