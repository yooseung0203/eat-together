package coma.spring.controller;

import java.io.File;
import java.io.FileWriter;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
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

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import coma.spring.dto.MapDTO;
import coma.spring.service.MapService;

@Controller
@RequestMapping("/map/")
public class MapController {

	private static final String HOST = "https://dapi.kakao.com";

	@Autowired
	private MapService mservice;

	@RequestMapping("toMap")
	public String map(HttpServletRequest request) throws Exception{
		// 등록된 맛집 뿌려주기
		List<MapDTO> list = mservice.selectAll();
		Gson gson = new Gson();
		String object = gson.toJson(list);
		request.setAttribute("json", object);
		String fileName = "D:\\Spring\\workspace\\eat-together-1\\src\\main\\webapp\\resources\\json\\mapData.json";

		File file = new File(fileName);
		FileWriter fw = new FileWriter(file, false);

		fw.write(object);
		fw.flush();
		fw.close();
		return "/map/map";
	}
	@RequestMapping("insert")
	public String insert(MapDTO mdto, String detail_category) throws Exception {
		// 판단
		if(!mservice.insertPossible(mdto.getPlace_url())) {
			return "/map/insertFail";
		}else {
			System.out.println(mdto.getName() + " : " + 
					mdto.getAddress() + " : " + 
					mdto.getRoad_address() + " : " +
					mdto.getCategory() + " : " + 
					mdto.getLat() + " : " + 
					mdto.getLng() + " : " +
					mdto.getRating_avg() + " : " +
					mdto.getPhone() + " : " + 
					mdto.getPlace_url());
			mservice.insert(mdto);
			return "redirect:/map/toMap";
		}
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

	@RequestMapping(value="search",method=RequestMethod.GET)
	public String searchByKeyword(String keyword, HttpServletRequest req) throws Exception{
		RestTemplate restTemplate = new RestTemplate();

		MultiValueMap<String, Object> params = new LinkedMultiValueMap<String, Object>();
		params.add("query", keyword);
		params.add("page", 3);
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + "e156322dd35cfd9dc276f1365621ae9a");
		headers.add("Accept",MediaType.APPLICATION_JSON_UTF8_VALUE);
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charser=UTF-8");		

		HttpEntity<MultiValueMap<String, Object>> request = new HttpEntity<>(params, headers);
		String respBody = restTemplate.postForObject(new URI(HOST + "/v2/local/search/keyword.json"), request, String.class);
//		System.out.println("respBody : " + respBody);

		Gson gson = new Gson();
		JsonObject obj = gson.fromJson(respBody, JsonObject.class);
		JsonArray docs = (JsonArray)obj.get("documents");
//		System.out.println("object : " + obj);
//		System.out.println("documents : " + docs);
		
		//request로 정보 보내주기
		// 페이지별 값 어케 받아와?????????????????????????????????
		for(JsonElement doc : docs) {
//			System.out.println("doc : " + doc);
			JsonObject docobj = doc.getAsJsonObject(); 
			System.out.println("장소명 : " + docobj.get("place_name"));
			System.out.println("장소ID : " + docobj.get("id"));
		}
		int place_id = 1; // 장소id 값 불러오기
		//List<MapDTO> list = mservice.searchByKeyword(place_id);
		//req.setAttribute("search_list", list);
		return "redirect:/map/toMap";
	}

}
