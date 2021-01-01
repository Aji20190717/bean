package com.power.bean.util;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import javax.mail.internet.MimeMessage;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

import com.power.bean.dao.QuartzClassDao;

public class LogProcessor {
	
	private QuartzClassDao quartzClassdao;
	private JavaMailSender mailSender;
	
	public void setQuartzClassdao(QuartzClassDao quartzClassdao) {
		this.quartzClassdao = quartzClassdao;
	}

	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}

	public void process() {
		
		Calendar nowTime = Calendar.getInstance();
		SimpleDateFormat simpledate = new SimpleDateFormat("[yyyy-MM-dd:mm:ss]");
		String strNowTime = simpledate.format(nowTime.getTime());
		
		System.out.println(strNowTime + ": 수업 종료 및 이메일 전송 process 시작");
	
	}
	
	public void classFinProcess() {
		
		//날짜가 지난 수업의 상태를 F로 바꿈
		int res = quartzClassdao.classListFin();
		
	}
	
	//수업이 종료된 학생들에게 메일을 전송
	public void mailProcess() {
		
		String setfrom = "temp59382";
	
		List<String> finstudentList = quartzClassdao.FinStudentList();
		List<String> finClassStudentInformList = quartzClassdao.classFinStudentClassInform(finstudentList);
		JSONParser parser = new JSONParser();
		
		for (String informString : finClassStudentInformList) {


			String jsonString = "{" + informString + "}";
			Object obj;
			
			try {
				obj = parser.parse(jsonString);
				JSONObject jsonObj = (JSONObject) obj;
				Iterator keyIterator = jsonObj.keySet().iterator();
				
				while(keyIterator.hasNext()) {
					
					//email 번호, className 을 얻음
					//수업이 종료된 학생에게 메일로 수업 전송을 알림
					String email = keyIterator.next().toString();
					String className = (String) jsonObj.get(email);
					String title = "수업 종료 메일입니다";
					String content = className + " 수업이 종료되었습니다";
					
					MimeMessage message = mailSender.createMimeMessage();
					try {
						MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
						messageHelper.setFrom(setfrom);
						messageHelper.setTo(email);
						messageHelper.setSubject(title);
						messageHelper.setText(content);
						
						mailSender.send(message); 
						
					} catch (Exception e) {
						e.printStackTrace();
					}
							
					
				}
				
			} catch (ParseException e) {
				e.printStackTrace();
			}

		}
	}
	
}
