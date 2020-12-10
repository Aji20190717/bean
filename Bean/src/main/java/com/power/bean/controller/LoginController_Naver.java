package com.power.bean.controller;

import java.io.IOException;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.power.bean.biz.NaverLoginBiz;

@Controller
public class LoginController_Naver {

	/* naverLoginBiz */
	private NaverLoginBiz naverLoginBiz;
	private String apiResult = null;

	@Autowired
	private void setnaverLoginBiz(NaverLoginBiz naverLoginBiz) {
		this.naverLoginBiz = naverLoginBiz;
	}

	// 로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBiz클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBiz.getAuthorizationUrl(session);
		System.out.println("네이버:" + naverAuthUrl);
		// 네이버
		model.addAttribute("url", naverAuthUrl);
		return "login";
	}

	// 네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/navercallback.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException, ParseException {
		System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBiz.getAccessToken(session, code, state);
		// 1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBiz.getUserProfile(oauthToken); // String형식의 json데이터
		/**
		 * apiResult json 구조 {"resultcode":"00", "message":"success",
		 * "response":{"id":"33666449","name":"shinn****","email":"sh@naver.com"}}
		 **/
		// 2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		// 3. 데이터 파싱
		// Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject) jsonObj.get("response");
		// response의 name값 파싱
		String name = (String) response_obj.get("name");
		String member_sns = "Naver" + (String) response_obj.get("id");
		String member_email = (String) response_obj.get("email");
		System.out.println(name);
		// 4.파싱 닉네임 세션으로 저장
		model.addAttribute("member_sns", member_sns);
		model.addAttribute("member_email", member_email);
		model.addAttribute("member_name", name);
		model.addAttribute("result", apiResult);
		
		return "registNaver";
	}

	// 로그아웃
	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session)throws IOException {
		System.out.println("여기는 logout");
		session.invalidate();
		return "redirect:index.jsp";
	}

}
