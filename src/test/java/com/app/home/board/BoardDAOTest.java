package com.app.home.board;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.app.home.board.unknown.UnknownService;

@SpringBootTest
class BoardDAOTest {

	@Autowired
	private UnknownService unknownService;
	
	//@Test
	void test() {
		fail("Not yet implemented");
	}
	
	//@Test
	void pagingTest() throws Exception {
		int result = 0;
		for(int i = 0; i < 10; i++) {
			BoardVO boardVO = new BoardVO();
			boardVO.setId(1234);
			boardVO.setTitle("test" + i);
			boardVO.setContents("test" + i);
			boardVO.setDepnum(null);
			boardVO.setSort(3);
			
			unknownService.setUnknownAdd(boardVO);
			result++;
		}
		assertEquals(10, result);
	}

}
