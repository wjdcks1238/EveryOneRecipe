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
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import com.google.gson.Gson;
import com.kh.everyrecipe.board.service.BoardService;
import com.kh.everyrecipe.board.vo.BoardVo;
import com.kh.everyrecipe.board.vo.IngredientVo;
import com.kh.everyrecipe.board.vo.PostVo;
import com.kh.everyrecipe.board.vo.RecommendVo;

@Configuration
@PropertySource("classpath:apiKeys.properties")
@Controller
public class TempForTable {
	
	@Autowired private BoardService service;
	
	@GetMapping("test")
	public String test() {
		
		
	

		
		return "test";
	}
	

	@PostMapping("searchAjax")
	@ResponseBody
	public List<String> searchAjax(String ingSearch) {
		List<String> ingList =null;
		
		try {
			//재료 선택(ajax를 이용해 검색)
			//재료 중복 제거 
			ingList = service.searchIng(ingSearch);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ingList;
	}
	
	@PostMapping("recommend")
	public ModelAndView recommend(ModelAndView mv, @RequestParam("list") String list ) throws Exception {
		System.out.println("값"+list);
		
		List<String> chosenList = new ArrayList<String>(Arrays.asList(list.split("\\$")));
		chosenList.remove("");
////		System.out.println(chosenList);
//		HashSet<String> set = new HashSet<>();
//		
//		
//		List<IngredientVo> ingList=null;
//		try {
//			ingList = service.getIngredients();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		//postId로 구분된 전체 재료 셋
//		Map<Integer, List<String>> allIngMap = new HashMap<>();
//		
//		//postId로 구분해야함 
//		//TODO 삭제된게시물 제외
//		
//		
//		int lastPostId= ingList.get(ingList.size()-1).getPostId();
//		for(int i=1; i<=lastPostId;i++) {
//			List<String> cuisineSet = new ArrayList<String>();
//			
//			for(int j=0; j<ingList.size();j++) {				
//				if(ingList.get(j).getPostId()==i) {
//					cuisineSet.add(ingList.get(j).getIngredient());
//				}
//			}
//			allIngMap.put(i, cuisineSet); 
//		}
//		System.out.println("전체:"+allIngMap);
//		
//		
//		

		List<PostVo> recList0 = new ArrayList();
		List<PostVo> recList1 = new ArrayList();
		List<PostVo> recList2 = new ArrayList();
		List<PostVo> recList3 = new ArrayList();
		
		List<List<String>> needList1 = new ArrayList();
		List<List<String>> needList2 = new ArrayList();
		List<List<String>> needList3 = new ArrayList();
//		for(int i=1;i<=lastPostId;i++) {
//			if(combination(allIngMap.get(i), allIngMap.get(i).size() , allIngMap.get(i).size(), 0, set, chosenList)) {
//				
////				System.out.println(i+"번째 레시피");
////				recList.add(allIngMap.get(i));
//				recList0.add(service.selectOne(i));
//			}			
//			if(combination(allIngMap.get(i), allIngMap.get(i).size() , allIngMap.get(i).size()-1, 0, set, chosenList)) {
//				
////				System.out.println(i+"번째 레시피");
////				recList.add(allIngMap.get(i));
//				recList1.add(service.selectOne(i));
//			}			
//			if(combination(allIngMap.get(i), allIngMap.get(i).size() , allIngMap.get(i).size()-2, 0, set, chosenList)) {
//				
////				System.out.println(i+"번째 레시피");
////				recList.add(allIngMap.get(i));
//				recList2.add(service.selectOne(i));
//			}			
//			if(combination(allIngMap.get(i), allIngMap.get(i).size() , allIngMap.get(i).size()-3, 0, set, chosenList)) {
//				
////				System.out.println(i+"번째 레시피");
////				recList.add(allIngMap.get(i));
//				recList3.add(service.selectOne(i));
//			}			
//		}
//		recList3.removeAll(recList2);
//		recList3.removeAll(recList1);
//		recList3.removeAll(recList0);
//		recList2.removeAll(recList1);
//		recList2.removeAll(recList0);
//		recList1.removeAll(recList0);
//		
//		
//		//TODO 재료 입력시 $문자 사용 불가능하게 변경
//		
//		
//
//		
//

		List<RecommendVo> recList= service.getIngForRec(chosenList);
		
		//선택한 재료와 레시피 재료의 차집합 구해서 같이넣어줌
		
		for(RecommendVo vo: recList) {
			//레시피의 전체 재료수    레시피 재료들중 가지고있는 재료 수
			if(vo.getIngcnt()-vo.getCnt()==0) {
				PostVo pvo = service.selectOne(vo.getPostId());
				recList0.add(pvo);
				
			}
			if(vo.getIngcnt()-vo.getCnt()==1) {
				PostVo pvo = service.selectOne(vo.getPostId());
				recList1.add(pvo);
				List<String> inglist = new ArrayList<String>();
				for(IngredientVo ivo  : pvo.getIngredients()) {
					inglist.add(ivo.getIngredient());
				}
				inglist.removeAll(chosenList);
				needList1.add(inglist);
			}	
			if(vo.getIngcnt()-vo.getCnt()==2) {
				PostVo pvo = service.selectOne(vo.getPostId());
				recList2.add(pvo);
				
				List<String> inglist = new ArrayList<String>();
				for(IngredientVo ivo  : pvo.getIngredients()) {
					inglist.add(ivo.getIngredient());
				}
				inglist.removeAll(chosenList);
				needList2.add(inglist);
			}
			if(vo.getIngcnt()-vo.getCnt()==3) {
				PostVo pvo = service.selectOne(vo.getPostId());
				recList3.add(pvo);
				
				List<String> inglist = new ArrayList<String>();
				for(IngredientVo ivo  : pvo.getIngredients()) {
					inglist.add(ivo.getIngredient());
				}
				inglist.removeAll(chosenList);
				needList3.add(inglist);
			}
		}
		
		
		mv.addObject("recList0", recList0);
		mv.addObject("recList1", recList1);
		mv.addObject("recList2", recList2);
		mv.addObject("recList3", recList3);
		
		mv.addObject("needList1", needList1);
		mv.addObject("needList2", needList2);
		mv.addObject("needList3", needList3);
		
		
		mv.addObject("chosenList", chosenList);
		
		mv.setViewName("recommend");

		
		
		
		
		 
		
		
		
		
		
		return mv;
	}
	
	private static boolean combination(List<String> ingList, int n, int r, int index, HashSet<String> set,List<String> chosenList ) {
		if(r==0) {
//			for(String i : set) {
//				System.out.print(i+" ");	
//			}
			//조합 구해짐
			if(chosenList.containsAll(set)) {				
				System.out.println(set);
				return true;
			}else {
				return false;
			}

			

		}
		
		for (int i = index; i < n; i++) {
	        set.add(ingList.get(i));
	        if (combination(ingList, n, r - 1, i + 1, set, chosenList)) {
	            return true;
	        }
	        set.remove(ingList.get(i));
	    }
		
		
		return false;
		
	}
	
	
	
	
	//PropertySource 에너테이션사용
	@Value("${recipe}")
	private String key ;
	@GetMapping("/temp")
	public String insertTable() {
		
		
		
	
		
		
		
		
		//삽입이 6번 이루어져야 한다.
		
		//메뉴 1~85
		//과정 1~471  
		//재료 1~999	 1~85
		
		//메뉴 86~176
		//과정 472~956    
		//재료 1000~1993 86~176
		
		//메뉴 177~ 262
		//과정 957~1406  
		//재료 1994~2990 177~ 262
		
		//메뉴 263~359
		//과정 1407~1906 
		//재료 2991~3985 263~359
		
		//메뉴 360~ 447
		//과정 1907~2374  
		//재료 3986~4981	360~ 447
		
		//메뉴 448~537
		//과정 2375~2797 
		//재료 4982~5720 448~537

		
		
		List<Map<String, Integer>>  rangeForM = new ArrayList<Map<String,Integer>>();
		List<Map<String, Integer>>  rangeForC = new ArrayList<Map<String,Integer>>();
		List<Map<String, Integer>>  rangeForI = new ArrayList<Map<String,Integer>>();
		
		

		rangeForM.add(new HashMap<String, Integer>(){{put("from", 1);put("to", 85); }} );
		rangeForM.add(new HashMap<String, Integer>(){{put("from", 86);put("to", 176); }} );
		rangeForM.add(new HashMap<String, Integer>(){{put("from", 177);put("to", 262); }} );
		rangeForM.add(new HashMap<String, Integer>(){{put("from", 263);put("to", 359); }} );
		rangeForM.add(new HashMap<String, Integer>(){{put("from", 360);put("to", 447); }} );
		rangeForM.add(new HashMap<String, Integer>(){{put("from", 448);put("to", 537); }} );
		

		rangeForC.add(new HashMap<String, Integer>(){{put("from", 1);put("to", 471); }} );
		rangeForC.add(new HashMap<String, Integer>(){{put("from", 472);put("to", 956); }} );
		rangeForC.add(new HashMap<String, Integer>(){{put("from", 957);put("to", 1406); }} );
		rangeForC.add(new HashMap<String, Integer>(){{put("from", 1407);put("to", 1906); }} );
		rangeForC.add(new HashMap<String, Integer>(){{put("from", 1907);put("to", 2374); }} );
		rangeForC.add(new HashMap<String, Integer>(){{put("from", 2375);put("to", 2797); }} );
		
		
		rangeForI.add(new HashMap<String, Integer>(){{put("from", 1);put("to", 999); }} );
		rangeForI.add(new HashMap<String, Integer>(){{put("from", 1000);put("to", 1993); }} );
		rangeForI.add(new HashMap<String, Integer>(){{put("from", 1994);put("to", 2990); }} );
		rangeForI.add(new HashMap<String, Integer>(){{put("from", 2991);put("to", 3985); }} );
		rangeForI.add(new HashMap<String, Integer>(){{put("from", 3986);put("to", 4981); }} );
		rangeForI.add(new HashMap<String, Integer>(){{put("from", 4982);put("to", 5720); }} );
				
	
		String menu="";
		String ingredient="";
		String cuisine="";
		
		
	for(int k=0; k<4;k++) {
		
	
		 
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
		
		 
		 
		 
		try {
			//url에 요청인자 삽입
			urlBuilder1.append(URLEncoder.encode(key, "UTF-8"));//인증키
			urlBuilder1.append("/" + URLEncoder.encode("xml", "UTF-8"));
			urlBuilder1.append("/" + URLEncoder.encode("Grid_20150827000000000226_1", "UTF-8")); /*레시피 기본정보*/
//			urlBuilder.append("/" + URLEncoder.encode("Grid_20150827000000000227_1", "UTF-8")); /*레시피 재료정보*/
//			urlBuilder.append("/" + URLEncoder.encode("Grid_20150827000000000228_1", "UTF-8")); /*레시피 과정정보*/
			urlBuilder1.append("/" + URLEncoder.encode( rangeForM.get(k).get("from")+"" , "UTF-8") + "/" + URLEncoder.encode(rangeForM.get(k).get("to")+"", "UTF-8")); /*레시피 기본정보*/
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
			urlBuilder2.append("/" + URLEncoder.encode("Grid_20150827000000000227_1", "UTF-8")); /*레시피 재료정보*/
			urlBuilder2.append("/" + URLEncoder.encode(rangeForI.get(k).get("from")+"" , "UTF-8") + "/" + URLEncoder.encode(rangeForI.get(k).get("to")+"", "UTF-8"));
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
			
            expr = xpath.compile("//Grid_20150827000000000227_1/row");//<Grid_20150827000000000226_1> 아래의 <row>의 값들을 읽음
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
			urlBuilder3.append("/" + URLEncoder.encode("Grid_20150827000000000228_1", "UTF-8")); /*레시피 과정정보*/
			urlBuilder3.append("/" + URLEncoder.encode(rangeForC.get(k).get("from")+"" , "UTF-8") + "/" + URLEncoder.encode(rangeForC.get(k).get("to")+"", "UTF-8"));
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
			e1.printStackTrace();
		}
			
	}
	
		
		
		
		
		
		
		
		
		
		System.out.println(menu);
		System.out.println(cuisine);
		System.out.println(ingredient);
		
		//$로 크게 나누고 %로 다시 나눠서 index(0)으로 재료코드를 얻는다.
		//
		
		//메뉴 
		List<String> mn = new ArrayList<String>();
		Map<String,String> m = new HashMap<String, String>();

		mn.addAll(Arrays.asList(menu.split("\\$")));
		for(String s : mn) {
			m.put(s.split("%")[0], s.split("%")[1]);
		}

						
		
		//재료 
		//map 안에 map 넣기 
		

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
		
		
		
		
		//과정
		List<String> csn = new ArrayList<String>();
		Map<String,String> cs = new HashMap<String, String>();

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
		
		

		
		
		
		
		
		
		//m, ing, cs
		
//		객체에 담기(게시글)
		List<BoardVo> bvoList = new ArrayList<BoardVo>();
		for(int i=1; i<=359;i++) {
			BoardVo bvo = new BoardVo();
			
			bvo.setUserId("everys_recipe");
			bvo.setNickname("모두의 레시피");
			bvo.setFoodName(m.get(i+""));
			bvo.setContent(cs.get(i+""));
			bvo.setPostId(i);
			bvoList.add(bvo);
		}
//		System.out.println("bvolist"+bvoList);
		
//		객체에 담기(재료)
		System.out.println(ing);
		List<IngredientVo> iList = new ArrayList<IngredientVo>();
		for(int i=1; i<=359;i++) {
			
			LinkedHashMap<String, String> map =ing.get(i+"");
		
			System.out.println("map"+map);
			for (String key : map.keySet()) {
				IngredientVo ivo = new IngredientVo();
				String value = map.get(key);
				ivo.setPostId(i);
				ivo.setIngredient(key);
				ivo.setAmount(value); 
				iList.add(ivo);
			}
	
			
		}
		System.out.println(iList);
		try {
			//게시글 테이블에 저장 
			service.insertBasicPost(bvoList);
			//재료 테이블에 저장 
			service.insertIngList(iList);
		} catch (Exception e) {

			e.printStackTrace();
		}
		
	
		
		
		
		
		return "temp";
				
		
		
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
			
	}
	
}
