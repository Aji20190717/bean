package com.power.bean.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.power.bean.biz.PayingBiz;
import com.power.bean.dto.PayingDto;
import com.power.bean.util.IamportClient;

@Controller
public class PayingController {

	@Autowired
	private PayingBiz payingBiz;

	// TODO :admin page에 확인할 수 있는 부분을 만들 것
	@RequestMapping("/payingList.do")

	public List<PayingDto> payingList(Model model){
		
		return null;
	}

	@RequestMapping("/insertPaying.do")
	@ResponseBody
	public Map<String, Boolean> insertPaying(String jsonData, PayingDto payingDto){
	
		System.out.println(payingDto.toString());
		System.out.println(jsonData);
		
		Boolean check = true;

		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("check", check);
		
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
			ajaxmap = mapper.readValue(jsonData, Map.class);
			
			try {
				//System.out.println(iamportClient.paymentByImpUid(map.get("imp_uid")));
				apiResponse = iamportClient.paymentByImpUid(payingDto.getPayment_impuid());
				System.out.println(apiResponse);
				System.out.println(apiResponse.getClass());
				
				Object obj = parser.parse(apiResponse);
				JsonObject jsonObj = (JsonObject) obj;
				JsonElement response = jsonObj.get("response");
				realAmount = response.getAsJsonObject().get("amount").getAsString();
				System.out.println(realAmount);
			
				
							
			} catch (Exception e) {
				e.printStackTrace();
			}
					
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	
		return map;
		
		

	}

}
