package coma.spring.controller;

import java.net.URI;
import java.net.URISyntaxException;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

@Controller
@RequestMapping("/map/")
public class MapController {
	
	private static final String HOST = "https://dapi.kakao.com";
	
	@RequestMapping("toMap")
	public String map() {
		return "/map/map";
	}
	
	@ResponseBody
	@RequestMapping(value="food",produces="application/json;charset=utf8",method=RequestMethod.GET)
	public String getFood(String lng, String lat) throws RestClientException, URISyntaxException{
        RestTemplate restTemplate = new RestTemplate();
        
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("x", lng);
        params.add("y", lat);
        params.add("category_group_code", "FD6");
        params.add("radius", "20000");
        params.add("page", "45");
        	
	    HttpHeaders headers = new HttpHeaders();
	    headers.add("Authorization", "KakaoAK " + "e156322dd35cfd9dc276f1365621ae9a");
	    headers.add("Accept",MediaType.APPLICATION_JSON_UTF8_VALUE);
	    headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charser=UTF-8");
	    
        HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(params, headers);
        String respBody = restTemplate.postForObject(new URI(HOST + "/v2/local/search/category.json"), request, String.class);
        System.out.println(respBody);
		return respBody;
	}
	@ResponseBody
	@RequestMapping(value="cafe",produces="application/json;charset=utf8",method=RequestMethod.GET)
	public String getCafe(String lng, String lat) throws RestClientException, URISyntaxException{
        RestTemplate restTemplate = new RestTemplate();
        
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("x", lng);
        params.add("y", lat);
        params.add("category_group_code", "CE7");
        params.add("radius", "20000");
        params.add("page", "45");
        	
	    HttpHeaders headers = new HttpHeaders();
	    headers.add("Authorization", "KakaoAK " + "e156322dd35cfd9dc276f1365621ae9a");
	    headers.add("Accept",MediaType.APPLICATION_JSON_UTF8_VALUE);
	    headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charser=UTF-8");
	    
        HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(params, headers);
        String respBody = restTemplate.postForObject(new URI(HOST + "/v2/local/search/category.json"), request, String.class);
        System.out.println(respBody);
		return respBody;
	}
}
