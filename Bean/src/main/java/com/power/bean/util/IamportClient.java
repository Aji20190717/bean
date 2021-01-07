package com.power.bean.util;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Type;
import java.net.URISyntaxException;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.HttpClientBuilder;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.siot.IamportRestHttpClientJava.request.AuthData;
import com.siot.IamportRestHttpClientJava.request.CancelData;
import com.siot.IamportRestHttpClientJava.response.AccessToken;
import com.siot.IamportRestHttpClientJava.response.IamportResponse;
import com.siot.IamportRestHttpClientJava.response.Payment;

public class IamportClient {

	private static final String API_URL = "https://api.iamport.kr";
	private String api_key = "6694523600738736";
	private String api_secret = "0UvFDeDhRzHpP43Q9Nd1wyHZSn7CwwhwrNc41PmTp3je8n5hajjGR0GJoOmUlErMrDQttdmSgF7o3cGd";
	private HttpClient client = null;
	private Gson gson = new Gson();

	public IamportClient() {

		this.client = HttpClientBuilder.create().build();

	}

	private IamportResponse<AccessToken> getAuth() throws Exception {
		AuthData authData = new AuthData(api_key, api_secret);

		String authJsonData = gson.toJson(authData);

		try {
			StringEntity data = new StringEntity(authJsonData);

			HttpPost postRequest = new HttpPost(API_URL + "/users/getToken");
			postRequest.setHeader("Accept", "application/json");
			postRequest.setHeader("Connection", "keep-alive");
			postRequest.setHeader("Content-Type", "application/json");

			postRequest.setEntity(data);

			HttpResponse response = client.execute(postRequest);

			if (response.getStatusLine().getStatusCode() != 200) {
				throw new RuntimeException("Failed : HTTP error code : " + response.getStatusLine().getStatusCode());
			}

			ResponseHandler<String> handler = new BasicResponseHandler();
			String body = handler.handleResponse(response);

			Type listType = new TypeToken<IamportResponse<AccessToken>>() {
			}.getType();
			IamportResponse<AccessToken> auth = gson.fromJson(body, listType);

			return auth;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		return null;
	}

	private String postRequest(String path, String token, StringEntity postData) throws URISyntaxException {

		try {

			HttpPost postRequest = new HttpPost(API_URL + path);
			postRequest.setHeader("Accept", "application/json");
			postRequest.setHeader("Connection", "keep-alive");
			postRequest.setHeader("Content-Type", "application/json");
			postRequest.addHeader("Authorization", token);

			postRequest.setEntity(postData);

			HttpResponse response = client.execute(postRequest);

			if (response.getStatusLine().getStatusCode() != 200) {
				throw new RuntimeException("Failed : HTTP error code : " + response.getStatusLine().getStatusCode());
			}

			ResponseHandler<String> handler = new BasicResponseHandler();
			String body = handler.handleResponse(response);

			return body;

		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return null;
	}

	private String getRequest(String path, String token) throws URISyntaxException {

		try {

			HttpGet getRequest = new HttpGet(API_URL + path);
			getRequest.addHeader("Accept", "application/json");
			getRequest.addHeader("Authorization", token);

			HttpResponse response = client.execute(getRequest);

			if (response.getStatusLine().getStatusCode() != 200) {
				throw new RuntimeException("Failed : HTTP error code : " + response.getStatusLine().getStatusCode());
			}

			ResponseHandler<String> handler = new BasicResponseHandler();
			String body = handler.handleResponse(response);

			return body;

		} catch (ClientProtocolException e) {

			e.printStackTrace();

		} catch (IOException e) {

			e.printStackTrace();
		}

		return null;
	}

	public String getToken() throws Exception {

		IamportResponse<AccessToken> auth = this.getAuth();

		if (auth != null) {
			String token = auth.getResponse().getToken();
			return token;
		}

		return null;
	}

	public String paymentByMerchantUid(String merchantUid) throws Exception {

		String token = this.getToken();

		if (token != null) {

			String path = "/payments/find/" + merchantUid;
			String response = this.getRequest(path, token);

			Type listType = new TypeToken<IamportResponse<Payment>>() {
			}.getType();
			String payment = gson.fromJson(response, listType);

			return payment;
		}

		return null;
	}

	
	public String paymentByImpUid(String impUid) throws Exception {

	String token = this.getToken();

	if (token != null) {

		String path = "/payments/" + impUid;
		String response = this.getRequest(path, token);
		
		return response;
		
	}
	return null;
}


	public IamportResponse<Payment> cancelPayment(CancelData cancelData) throws Exception {

		String token = this.getToken();

		if (token != null) {
			String cancelJsonData = gson.toJson(cancelData);
			StringEntity data = new StringEntity(cancelJsonData);

			String response = this.postRequest("/payments/cancel", token, data);

			Type listType = new TypeToken<IamportResponse<Payment>>() {
			}.getType();
			IamportResponse<Payment> payment = gson.fromJson(response, listType);

			return payment;
		}
		return null;
	}
}
