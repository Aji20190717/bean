package com.power.bean.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.power.bean.biz.ClassBiz;
import com.power.bean.biz.PayingBiz;
import com.power.bean.dto.ClassDto;
import com.power.bean.dto.PayingDto;
import com.power.bean.util.IamportClient;

@Controller
public class PayingController {

	@Autowired
	private PayingBiz payingBiz;
	
	@Autowired 
	private ClassBiz classBiz;

	// TODO : admin page에 확인할 수 있는 부분을 만들 것
	@RequestMapping("/payingList.do")

	public List<PayingDto> payingList(Model model){
		
		return null;
	}

	@RequestMapping("/insertPaying.do")
	@ResponseBody
	public Map<String, Boolean> insertPaying(String jsonData, PayingDto payingDto){
		
		Boolean check = true;
		PayingDto insertDto = payingDto;
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		
		// Apache HttpClient기반의 java용 아임포트 REST API클라이언트
		IamportClient iamportClient = new IamportClient();
		String apiResponse;
		ObjectMapper mapper = new ObjectMapper();
		JsonParser parser = new JsonParser();
		
		Map<String, String> ajaxmap;
		Map<String, String> resultMap;
		Map<String, String> realResponse;
		
		String realAmount;
			
			try {
				//실제 결제 된 값이 결제 한 값과 같은 지 확인
				apiResponse = iamportClient.paymentByImpUid(payingDto.getPayment_impuid());
				Object obj = parser.parse(apiResponse);
				JsonObject jsonObj = (JsonObject) obj;
				JsonElement response = jsonObj.get("response");
				realAmount = response.getAsJsonObject().get("amount").getAsString();
				
				//값이 같을 경우 -> 영수증 데이터에 Dto 추가, class에 회원 추가
				if(realAmount.equals(payingDto.getPayment_price())) {
					
					insertDto.setPayment_state("Y");
					insertDto.setPayment_refund("N");
					
					int payingres = payingBiz.insertPaying(insertDto);
					int classres = classBiz.updateClassStudent(insertDto.getClass_no(),
							insertDto.getMember_no(), insertDto.getPayment_impuid());
					
					if(payingres<= 0 || classres <= 0) {
						check = false;
					}
				}else {
					
					insertDto.setPayment_state("N");
					insertDto.setPayment_refund("Y");
					int pyaingres = payingBiz.insertPaying(payingDto);
				}
										
			} catch (Exception e) {
				e.printStackTrace();
			}
					
		map.put("check", check);
		
		return map;
	}

}
