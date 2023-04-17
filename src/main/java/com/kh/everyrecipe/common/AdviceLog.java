package com.kh.everyrecipe.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StopWatch;

import com.kh.everyrecipe.board.vo.BoardVo;

@Service //@component, bean 가능 하지만 의미상 service가 낫다.
@Aspect
public class AdviceLog {
	
	private static final Logger logger = LoggerFactory.getLogger(AdviceLog.class);
	
	@Autowired private BadWordFilter badWordFilter;
	
	// * 1개 이상이 종류 상관 없이 존재함
	// .. 0개 이상이 종류 상관 없이 존재함
	//                                           ~Controller
	@Pointcut("execution(public * com.kh.everyrecipe..*Controller.*(..) )")
	public void controllerPointCut() {}
	// 위 pointcut의 이름은 "controllerPointCut()" 
	
	@Pointcut("execution(public * com.kh.everyrecipe..*Dao.*(..) )")
	public void daoPointCut() {}
	
	@Pointcut("execution(public * com.kh.everyrecipe..*ServiceImpl.*(..) )")
	public void serviceImplPointCut() {}
//	
//	@Pointcut("execution(public * com.kh.everyrecipe.board.controller.BoardController.post(..) )")
//	public void postingPointCut() {}

	
	
//	@Before("postingPointCut()")
//	public void checkBadWords(JoinPoint joinPoint) throws BadWordException {
//		
//		Object arg[] =  joinPoint.getArgs();
//		String content = ((BoardVo)arg[2]).getContent(); 
//		String food = ((BoardVo)arg[2]).getFoodName(); 
//		String ing= (String)(arg[3].toString());
//		System.out.println(ing);
//		String amt= (String)(arg[4].toString());
//		System.out.println(amt);
//		String tag= (String)(arg[5].toString());
//		System.out.println(tag);
//	    if (badWordFilter.containsBadWord(content)||badWordFilter.containsBadWord(ing)
//	    	||badWordFilter.containsBadWord(amt)||badWordFilter.containsBadWord(tag) 
//	    	||badWordFilter.containsBadWord(food) ) {
//	        throw new BadWordException("비속어가 포함된 게시글은 작성할 수 없습니다.");
//	    }
//	}
	
	@Around("controllerPointCut()")
	public Object aroundControllerPointCut(ProceedingJoinPoint pjp) throws Throwable {
		Object returnObj =null;
		
		logger.info("▶Ctrl: " +pjp.getThis()+" "+pjp.getSignature().getName());
		
		Object[] args= pjp.getArgs();//메서드의 매개변수들을 배열로 받는다.
		for(int i=0; i<args.length;i++) {
			logger.info("▶args["+i+"]:"+args[i]);
		}
		
		StopWatch stopwatch = new StopWatch();
		stopwatch.start();
		returnObj = pjp.proceed();
		stopwatch.stop();
		
		logger.info("▶Controller Return["+stopwatch.getTotalTimeMillis()+"Millis]"+ returnObj);
		return returnObj;
	}
	@Around("daoPointCut()")
	public Object aroundDaoPointCut(ProceedingJoinPoint pjp) throws Throwable {
		Object returnObj =null;
		logger.info("▶▶DAO: " +pjp.getThis()+" "+pjp.getSignature().getName());
		
		Object[] args= pjp.getArgs();//
		for(int i=0; i<args.length;i++) {
			logger.info("▶▶args["+i+"]:"+args[i]);
		}
		StopWatch stopwatch = new StopWatch();
		stopwatch.start();
		returnObj = pjp.proceed();
		stopwatch.stop();
		
		logger.info("▶▶DAO Return["+stopwatch.getTotalTimeMillis()+"Millis]"+ returnObj);
		return returnObj;
	}
	
	@Around("serviceImplPointCut()")
	public Object aroundServiceImpl(ProceedingJoinPoint pjp) throws Throwable {
		Object returnObj =null;
		logger.info("▶▶▶Service: " +pjp.getThis()+" "+pjp.getSignature().getName());
		
		Object[] args= pjp.getArgs();//
		for(int i=0; i<args.length;i++) {
			logger.info("▶▶▶args["+i+"]:"+args[i]);
		}
		StopWatch stopwatch = new StopWatch();
		stopwatch.start();
		returnObj = pjp.proceed();
		stopwatch.stop();
		
		logger.info("▶▶▶Service Return["+stopwatch.getTotalTimeMillis()+"Millis]"+ returnObj);
		return returnObj;
	}
	

	
	
	
	
	
}
