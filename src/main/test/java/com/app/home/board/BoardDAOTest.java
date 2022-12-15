package com.app.home.board;

import static org.junit.Assert.assertNotNull;
import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.app.home.board.notice.NoticeService;
import com.app.home.board.reqcategory.ReqCategoryVO;
import com.app.home.board.request.RequestService;
import com.app.home.board.unknown.UnknownService;

@SpringBootTest
class BoardDAOTest {

	@Autowired
	private UnknownService unknownService;
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private BoardDAO boardDAO;
	
	//@Test
//	void test() {
//		fail("Not yet implemented");
//	}
	
	@Test
	void pagingTest() throws Exception {
		int result = 0;
		for(int i = 0; i < 30; i++) {
			BoardVO boardVO = new BoardVO();
			boardVO.setId(1234);
			boardVO.setTitle("test" + i);
			boardVO.setContents("test" + i);
			boardVO.setDepnum(null);
			boardVO.setSort(1);
			
			noticeService.setNotice(boardVO);
//			unknownService.setUnknownAdd(boardVO);
			result++;
		}
		assertEquals(30, result);
	}
	
	@Test
	void categoryTest()throws Exception{
		ReqCategoryVO reqCategoryVO = new ReqCategoryVO();
		reqCategoryVO.setDepNum(1);
		List<ReqCategoryVO> al = boardDAO.findReqCategory(reqCategoryVO);
		
		
		assertEquals(2, al.size());
		
		
	}

}
