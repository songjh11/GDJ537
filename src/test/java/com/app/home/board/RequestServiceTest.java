package com.app.home.board;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class RequestServiceTest {
	
	@Autowired
	private BoardDAO boardDAO;

	@Test
	void inputTest()throws Exception {
		BoardVO boardVO = new BoardVO();
		int result = 0;
		for(int i = 0; i < 50; i++) {
			boardVO.setId(2022005);
			boardVO.setTitle("TEST 제목" + i);
			boardVO.setContents("TEST 내용" + i);
			boardVO.setDepnum(2);
			boardVO.setSort(2);
			result = boardDAO.setBoard(boardVO);
		}
		assertNotEquals(0, result);
	}

}
