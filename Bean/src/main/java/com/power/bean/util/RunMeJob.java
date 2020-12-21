package com.power.bean.util;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

public class RunMeJob extends QuartzJobBean{

	private LogProcessor logProcessor;
	
	//실행을 원하는 메소드 호출
	@Override
	protected void executeInternal(JobExecutionContext context) throws JobExecutionException {
		
		logProcessor.process();
		logProcessor.classFinProcess();
		logProcessor.mailProcess();
		
		
	}
	
	//실제 실행될 테스트를 setter 방식으로 주입
	public void setLogProcessor(LogProcessor logProcessor) {
		this.logProcessor = logProcessor;
	}
	

}
