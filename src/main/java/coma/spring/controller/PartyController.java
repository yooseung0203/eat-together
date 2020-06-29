package coma.spring.controller;

import java.net.URI;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.RequestEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import coma.spring.dto.PartyDTO;

@Controller
@RequestMapping("/party/")
public class PartyController {
	@RequestMapping("toParty_New")
	public String toPartyNew() {
		return "/party/party_new";
	}

	@RequestMapping(value = "party_New_Proc", method = RequestMethod.POST)
	/*public String partyNewProc(HttpServletRequest request) {*/
	public String partyNewProc(PartyDTO dto) {
		
		String title = dto.getTitle();
		String age = dto.getAge();
		String gender = dto.getGender();
		int count = dto.getCount();
		String drinking = dto.getDrinking();
		String content = dto.getContent();
		String date = dto.getDate();
		String time = dto.getTime();
		
		String dateAndtime = date + " "+time+":00.0";
		
		Timestamp meetdate = java.sql.Timestamp.valueOf(dateAndtime);

		/*
		 * String title = (String) request.getAttribute("title");
		 * 
		 * Date meetdate = (Date) request.getAttribute("meetdate");
		 * request.getAttribute("time");
		 * 
		 * String count = (String) request.getAttribute("count"); String gender =
		 * (String) request.getAttribute("gender"); String age = (String)
		 * request.getAttribute("age"); String drinking = (String)
		 * request.getAttribute("drinking"); String content = (String)
		 * request.getAttribute("content");
		 * 
		 * System.out.println(title); System.out.println(count);
		 * System.out.println(gender); System.out.println(age);
		 * System.out.println(drinking); System.out.println(content);
		 */

		return "/party/party_content";
	}
	
	
	
	@RequestMapping(value="toSearchStore", method=RequestMethod.GET)
	public String toSearchStore() {
		return "/party/searchStore";
	}
	
	@ResponseBody
	@RequestMapping(value="searchStoreProc", method=RequestMethod.GET, produces="application/json;charset=utf8")
	public Map<String, String> searchStoreProc(String keyword) throws Exception {
		String HOST = "https://dapi.kakao.com";
		String APIKEY = "KakaoAK 80c29b1bba14c9c568e4ae4f89fc9368";
		System.out.println(keyword);
		
		RestTemplate restTemplate = new RestTemplate(); 
		
		HttpHeaders headers = new HttpHeaders();
	    headers.add("Authorization", APIKEY);
	    headers.add("Accept",MediaType.APPLICATION_JSON_UTF8_VALUE);
	    headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charser=UTF-8");
	  
	    String  query = URLEncoder.encode(keyword,"UTF-8");

		HttpEntity entity = new HttpEntity("parameters", headers); 
		URI foodurl=URI.create("https://dapi.kakao.com/v2/local/search/keyword.json?query="+query+"&"+"category_group_code=FD6"); 
		URI cafeurl=URI.create("https://dapi.kakao.com/v2/local/search/keyword.json?query="+query+"&"+"category_group_code=CE7");
		RequestEntity<String> rq = new RequestEntity<>(headers, HttpMethod.GET, foodurl);
		//ResponseEntity<String> response= restTemplate.exchange(rq, String.class);
		
		RequestEntity<String> rq1 = new RequestEntity<>(headers, HttpMethod.GET, cafeurl);
		//ResponseEntity<String> response1= restTemplate.exchange(rq, String.class);
		
		
		String resp= restTemplate.postForObject(foodurl, rq, String.class);
		String resp2 = restTemplate.postForObject(cafeurl, rq, String.class);
		
		Map<String,String> respBody = new HashMap<String, String>();	
		respBody.put("food",resp);
		respBody.put("cafe",resp2);
		
        System.out.println(respBody);
		return respBody;

	}
}
