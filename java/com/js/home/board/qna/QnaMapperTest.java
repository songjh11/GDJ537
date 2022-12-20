package com.js.home.board.qna;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import com.js.home.util.Pager;

@SpringBootTest
//@Rollback(true)	//무조건 롤백
@Transactional(rollbackFor = Exception.class)
class QnaMapperTest {
	
	private final Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Value("${my.dafault}")
	private String app;
	
	//전체 test 실행 전
//	@BeforeAll
//	static void beforeAll(){
//		System.out.println("전체 테스트 실행 전");
//	}
//	
//	@AfterAll
//	static void afterAll(){
//		System.out.println("전체 테스트 실행 후 ");
//	}
//	
//	//각각의 testcase 메서드 실행 전
//	@BeforeEach
//	static void beforeEach(){
//		System.out.println("전체 테스트 실행 후 ");
//	}
//	
//	@AfterEach
//	static void afterEach(){
//		System.out.println("전체 테스트 실행 후 ");
//	}

	
	@Autowired
	private QnaMapper qnaMapper;
	
	//@Test
	public void getListTest(Pager pager) throws Exception{
		List<QnaVO> ar = qnaMapper.getQnaList(pager);
		
		log.info("List : {}" , ar);
		
		assertNotEquals(0, ar.size());
	}
	
	//@Test
	public void setQnaAddTest() throws Exception{
		
		log.info("============{}==========", app);
		
		QnaVO qnaVO = new QnaVO();
		qnaVO.setWriter("js");
		qnaVO.setTitle("하이");
		qnaVO.setContents("내용");
		
		//int result = qnaMapper.setQnaAdd(qnaVO);
		
//		log.info("result : " , result);
		
		assertEquals(1, 1);
	}
	
	//@Test
	public void setQnaIndexTest() throws Exception{
		
		QnaVO qnaVO = new QnaVO();
		
		for(int i=0;i<200;i++) {
			
			qnaVO.setNum(null);
			qnaVO.setWriter("js" + i);
			qnaVO.setTitle("제목" + i);
			qnaVO.setContents("내용" + i);
			
			int result = qnaMapper.setQnaAdd(qnaVO);
			
			assertEquals(1, result);
			
			
		}
	}

}
