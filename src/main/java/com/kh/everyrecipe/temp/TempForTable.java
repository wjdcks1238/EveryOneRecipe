package com.kh.everyrecipe.temp;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import com.google.gson.Gson;
import com.kh.everyrecipe.board.service.BoardService;
import com.kh.everyrecipe.board.vo.BoardVo;
import com.kh.everyrecipe.board.vo.IngredientVo;
import com.kh.everyrecipe.board.vo.PostVo;

@Configuration
@PropertySource("classpath:apiKeys.properties")
@Controller
public class TempForTable {
	
	@Autowired private BoardService service;
	
	@GetMapping("test")
	public String test() {
		
		return "test";
	}
	
	@PostMapping("testAjax")
	@ResponseBody
	public String testAjax( int curPage, int pageListSize ) {
		List<PostVo> pvoList=null;
//		System.out.println(map.get("curPage"));
//		System.out.println(map.get("pageListSize"));
		System.out.println(curPage);
		System.out.println(pageListSize);
		
		
		
		try {
			pvoList= service.pagingList(curPage, pageListSize);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return new Gson().toJson(pvoList);
	}
	
	
	//PropertySource 에너테이션사용
	@Value("${recipe}")
	private String key ;
	@GetMapping("/temp")
	public String insertTable() {
		
		
		
		
//		Properties prop = new Properties();
//		InputStream stream = getClass().getClassLoader().getResourceAsStream("apiKeys.properties");
//		try {
//			prop.load(stream);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		String key = prop.getProperty("recipe");

		
		
		
		
		
		URL url=null;
		BufferedReader br = null;
		String result1 = "";
		String result2 = "";
		String result3 = "";
		StringBuilder urlBuilder1 = new StringBuilder("http://211.237.50.150:7080/openapi/"); 
		StringBuilder urlBuilder2 = new StringBuilder("http://211.237.50.150:7080/openapi/"); 
		StringBuilder urlBuilder3 = new StringBuilder("http://211.237.50.150:7080/openapi/"); 
		
		// 2. 오픈 API의요청 규격에 맞는 파라미터 생성, 발급받은 인증키.
		
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		factory.setNamespaceAware(true);
		DocumentBuilder builder;
		Document doc = null;
		HttpURLConnection urlconnection =null;
		String line;
		InputSource is=null;
		XPathFactory xpathFactory =null;
		 XPath xpath=null;
		 XPathExpression expr=null;
		 NodeList nodeList =null;
		 
		 
		 
		 

		 //map 배열 사용
		 //{레시피 번호:1,{내용$내용$....}}
		 
		 
		 
		 //1   %a% a  $  2 % b % b$...
		 //이렇게 저장 후 $스플릿  
		 //다시 %로 스플릿이후 인덱스(0)로 분류
		 
		 //메뉴이름 , 재료 이름수량, 조리법으로 나눠받는다  
		
		 
		 
		 String menu="";
		 String ingredient="";
		 String cuisine="";
		try {
			//url에 요청인자 삽입
			urlBuilder1.append(URLEncoder.encode(key, "UTF-8"));//인증키
			urlBuilder1.append("/" + URLEncoder.encode("xml", "UTF-8"));
			urlBuilder1.append("/" + URLEncoder.encode("Grid_20150827000000000226_1", "UTF-8")); /*레시피 기본정보*/
//			urlBuilder.append("/" + URLEncoder.encode("Grid_20150827000000000227_1", "UTF-8")); /*레시피 재료정보*/
//			urlBuilder.append("/" + URLEncoder.encode("Grid_20150827000000000228_1", "UTF-8")); /*레시피 과정정보*/
			urlBuilder1.append("/" + URLEncoder.encode("1", "UTF-8") + "/" + URLEncoder.encode("100", "UTF-8")); /*레시피 기본정보*/
			url = new URL(urlBuilder1.toString());
			urlconnection = (HttpURLConnection) url.openConnection();
			br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(), "UTF-8"));
			
			while ((line = br.readLine()) != null) {
				result1 = result1 + line.trim();// result = URL로 XML을 읽은 값
			}
		
			is = new InputSource(new StringReader(result1));
            builder = factory.newDocumentBuilder();
            doc = builder.parse(is);
            xpathFactory = XPathFactory.newInstance();
            xpath = xpathFactory.newXPath();
			
          expr = xpath.compile("//Grid_20150827000000000226_1/row");//<Grid_20150827000000000226_1> 아래의 <row>의 값들을 읽음
//            expr = xpath.compile("//Grid_20150827000000000227_1/row");//<Grid_20150827000000000226_1> 아래의 <row>의 값들을 읽음
//            expr = xpath.compile("//Grid_20150827000000000228_1/row");//<Grid_20150827000000000226_1> 아래의 <row>의 값들을 읽음
            nodeList = (NodeList) expr.evaluate(doc, XPathConstants.NODESET);
            for (int i = 0; i < nodeList.getLength(); i++) {
                NodeList child = nodeList.item(i).getChildNodes();
                for (int j = 0; j < child.getLength(); j++) {	
                    Node node = child.item(j);
                    if(node.getTextContent()!="") {
                    	
                    	
                    	
                    	if("RECIPE_ID".equals(node.getNodeName())){
                    		menu+= node.getTextContent()+"%";
                    	}
                    			
                    			
                    	if("RECIPE_NM_KO".equals(node.getNodeName()) ) {
                    		
                    		menu+= node.getTextContent()+"$";                    		
                    	}

                    }
                }
            }
		System.out.println("--------------------------------------");
          //url에 요청인자 삽입
			urlBuilder2.append(URLEncoder.encode(key, "UTF-8"));//인증키
			urlBuilder2.append("/" + URLEncoder.encode("xml", "UTF-8"));
//			urlBuilder.append("/" + URLEncoder.encode("Grid_20150827000000000226_1", "UTF-8")); /*레시피 기본정보*/
			urlBuilder2.append("/" + URLEncoder.encode("Grid_20150827000000000227_1", "UTF-8")); /*레시피 재료정보*/
//			urlBuilder2.append("/" + URLEncoder.encode("Grid_20150827000000000228_1", "UTF-8")); /*레시피 과정정보*/
			urlBuilder2.append("/" + URLEncoder.encode("1", "UTF-8") + "/" + URLEncoder.encode("1000", "UTF-8"));
			url = new URL(urlBuilder2.toString());
			urlconnection = (HttpURLConnection) url.openConnection();
			br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(), "UTF-8"));
			
			while ((line = br.readLine()) != null) {
				result2 = result2 + line.trim();// result = URL로 XML을 읽은 값
			}
		
			is = new InputSource(new StringReader(result2));
            builder = factory.newDocumentBuilder();
            doc = builder.parse(is);
            xpathFactory = XPathFactory.newInstance();
            xpath = xpathFactory.newXPath();
			
//          expr = xpath.compile("//Grid_20150827000000000226_1/row");//<Grid_20150827000000000226_1> 아래의 <row>의 값들을 읽음
            expr = xpath.compile("//Grid_20150827000000000227_1/row");//<Grid_20150827000000000226_1> 아래의 <row>의 값들을 읽음
//            expr = xpath.compile("//Grid_20150827000000000228_1/row");//<Grid_20150827000000000226_1> 아래의 <row>의 값들을 읽음
            nodeList = (NodeList) expr.evaluate(doc, XPathConstants.NODESET);
            for (int i = 0; i < nodeList.getLength(); i++) {
                NodeList child = nodeList.item(i).getChildNodes();
                for (int j = 0; j < child.getLength(); j++) {
                    Node node = child.item(j);
                    if(node.getTextContent()!="") {
                    	
                    	if("RECIPE_ID".equals(node.getNodeName())) {
                    		
                    		ingredient+= node.getTextContent()+"%";
                    	}
                    		
                    		
                    	if( "IRDNT_NM".equals(node.getNodeName())) {
                    		ingredient+= node.getTextContent()+"%";
            		
                    	}
                    	
                    	if("IRDNT_CPCTY".equals(node.getNodeName()) ) {
                    		ingredient+= node.getTextContent()+"$"; 
                    	}

                    }
                }
            }
		
            
            System.out.println("--------------------------------------");
            
          //url에 요청인자 삽입
			urlBuilder3.append(URLEncoder.encode(key, "UTF-8"));//인증키
			urlBuilder3.append("/" + URLEncoder.encode("xml", "UTF-8"));
//			urlBuilder.append("/" + URLEncoder.encode("Grid_20150827000000000226_1", "UTF-8")); /*레시피 기본정보*/
//			urlBuilder.append("/" + URLEncoder.encode("Grid_20150827000000000227_1", "UTF-8")); /*레시피 재료정보*/
			urlBuilder3.append("/" + URLEncoder.encode("Grid_20150827000000000228_1", "UTF-8")); /*레시피 과정정보*/
			urlBuilder3.append("/" + URLEncoder.encode("1", "UTF-8") + "/" + URLEncoder.encode("600", "UTF-8"));
			url = new URL(urlBuilder3.toString());
			urlconnection = (HttpURLConnection) url.openConnection();
			br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(), "UTF-8"));
			
			while ((line = br.readLine()) != null) {
				result3 = result3 + line.trim();// result = URL로 XML을 읽은 값
			}
		
			is = new InputSource(new StringReader(result3));
            builder = factory.newDocumentBuilder();
            doc = builder.parse(is);
            xpathFactory = XPathFactory.newInstance();
            xpath = xpathFactory.newXPath();
			
//          expr = xpath.compile("//Grid_20150827000000000226_1/row");//<Grid_20150827000000000226_1> 아래의 <row>의 값들을 읽음
//            expr = xpath.compile("//Grid_20150827000000000227_1/row");//<Grid_20150827000000000226_1> 아래의 <row>의 값들을 읽음
            expr = xpath.compile("//Grid_20150827000000000228_1/row");//<Grid_20150827000000000226_1> 아래의 <row>의 값들을 읽음
            nodeList = (NodeList) expr.evaluate(doc, XPathConstants.NODESET);
            for (int i = 0; i < nodeList.getLength(); i++) {
                NodeList child = nodeList.item(i).getChildNodes();
                for (int j = 0; j < child.getLength(); j++) {
                    Node node = child.item(j);
                    if(node.getTextContent()!="") {
                    	
                    	if(node.getTextContent()!="") {
                        	
                        	if("RECIPE_ID".equals(node.getNodeName())){
                        		cuisine+= node.getTextContent()+"%";
                        	}
                        			
                        	if("COOKING_DC".equals(node.getNodeName()) ) {
                        		
                        		cuisine+= node.getTextContent()+"$";                    		
                        	}
                    	}
                    }
                }
                	
            }  
            

		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
			
		
		
		
		//기본정보
//		RECIPE_ID	레시피 코드 (SEQ_RECIPE)
//		RECIPE_NM_KO	레시피 이름(한글)
//		SUMRY	간략(요약) 소개   x
//		NATION_CODE	유형코드  x
//		NATION_NM	유형분류  x
//		TY_CODE	음식분류코드   x
//		TY_NM	음식분류   x
//		COOKING_TIME	조리시간  x
//		CALORIE	칼로리  x
//		QNT	분량  x
//		LEVEL_NM	난이도  x
//		IRDNT_CODE	재료별 분류명 x
//		PC_NM	가격별 분류  x
		
		
		
		//재료 정보   
//		RECIPE_ID	레시피 코드
//		IRDNT_SN	재료순번  x
//		IRDNT_NM	재료명
//		IRDNT_CPCTY	재료용량
//		IRDNT_TY_CODE	재료타입 코드 x
//		IRDNT_TY_NM	재료타입명 x
		
		
		
		//레시피 과정정보
//		RECIPE_ID	레시피 코드
//		COOKING_NO	요리설명순서 x
//		COOKING_DC	요리설명
//		STEP_TIP	과정팁	x 	
		
		
		
		
		
		

		
		
		
		
		
		
		
//		
//		System.out.println(menu);
//		System.out.println();
//		System.out.println(ingredient);
//		System.out.println();
//		System.out.println(cuisine);
		//$로 크게 나누고 %로 다시 나눠서 index(0)으로 재료코드를 얻는다.
		//
		
		//메뉴 
		List<String> mn = new ArrayList<String>();
		Map<String,String> m = new HashMap<String, String>();
//		System.out.println(menu );
//		System.out.println(Arrays.toString(menu.split("\\$")) );

		mn.addAll(Arrays.asList(menu.split("\\$")));
		for(String s : mn) {
			m.put(s.split("%")[0], s.split("%")[1]);
		}
//		System.out.println(m);

						
		
		//재료 
		//map 안에 map 넣기 
		

//		System.out.println(Arrays.toString(ingredient.split("\\$")) );
		List<String> ingList = new ArrayList<String>();
		ingList.addAll(Arrays.asList(ingredient.split("\\$")));
		
		Map<String, LinkedHashMap<String, String>> ing = new HashMap<>();
		
		
		for(int i =0; i<ingList.size();i++) {
			String ingKey=ingList.get(i).split("%")[0];
			String ingVal=ingList.get(i).split("%")[1];
			String ingAmt=ingList.get(i).split("%")[2];
			
			
			if(ing.get(ingKey)==null) {
				LinkedHashMap<String, String> ig = new LinkedHashMap<String, String>();
				ig.put(ingVal, ingAmt);		
				ing.put(ingKey,ig );
			}else {
				ing.get(ingKey).put(ingVal, ingAmt);
			}
			
			
		}
		
//		System.out.println(ing);
		
		
		//한번 요청에 1000건까지만 가능해서 1~86번 레시피 까지만 가능. 
		
		
		//과정
		List<String> csn = new ArrayList<String>();
		Map<String,String> cs = new HashMap<String, String>();
//		System.out.println(menu );
//		System.out.println(Arrays.toString(cuisine.split("\\$")) );

		csn.addAll(Arrays.asList(cuisine.split("\\$")));
		
		for(int i =0; i<csn.size();i++) {
			String csnKey=csn.get(i).split("%")[0];
			String csnVal=csn.get(i).split("%")[1];			
			if(cs.get(csnKey) != null) {
				cs.put(csnKey, cs.get(csnKey)+"\n"+csnVal);
			}else {
				cs.put(csnKey, csnVal);			
			}
			
			
		}
		
		
//		System.out.println(cs);

		
		
		
		
		
		
		//m, ing, cs
		
//		객체에 담기(게시글)
		List<BoardVo> bvoList = new ArrayList<BoardVo>();
		for(int i=1; i<86;i++) {
			BoardVo bvo = new BoardVo();
			
			bvo.setUserId("everys_recipe");
			bvo.setNickname("모두의 레시피");
//			System.out.println(m.get(i+""));
			bvo.setFoodName(m.get(i+""));
			bvo.setContent(cs.get(i+""));
			bvo.setPostId(i);
//			System.out.println(cs.get(i+""));
			bvoList.add(bvo);
		}
//		System.out.println("bvolist"+bvoList);
		
//		객체에 담기(재료)
		List<IngredientVo> iList = new ArrayList<IngredientVo>();
		for(int i=1; i<86;i++) {
			
			LinkedHashMap<String, String> map =ing.get(i+"");
//			System.out.println("map"+map);
			for (String key : map.keySet()) {
				IngredientVo ivo = new IngredientVo();
				String value = map.get(key);
				ivo.setPostId(i);
				ivo.setIngredient(key);
				ivo.setAmount(value); 
				iList.add(ivo);
			}
			
			
//			ivo.setIngredient(ing.get(i));
//			ivo.setAmount(amount);
			//포스트 id처리 필요 
			//일단 1~86 으로 처리
			
			
		}
		System.out.println(iList);
		try {
			//게시글 테이블에 저장 
			service.insertBasicPost(bvoList);
			//재료 테이블에 저장 
			service.insertIngList(iList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		return "temp";
				
		
		
		
	}
	
}
