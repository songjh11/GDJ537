package com.app.home.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.app.home.board.request.ReqCategoryVO;
import com.app.home.util.Pager;

@Mapper
public interface BoardDAO {

	public List<BoardVO> getList(Pager pager) throws Exception;
	
	//조회수순으로 리스트 불러오기
	public List<BoardVO> getListByHit(Pager pager) throws Exception;
	
	//댓글수순으로 리스트 불러오기
	public List<BoardVO> getListByComment(Pager pager) throws Exception;

	public BoardVO getDetail(BoardVO boardVO) throws Exception;

	public int setBoard(BoardVO boardVO)throws Exception;

	public int setUpdate(BoardVO boardVO) throws Exception;

	public int setDelete(BoardVO boardVO) throws Exception;

	public int setHit(BoardVO boardVO) throws Exception;

	public Long getTotalCount(Pager pager) throws Exception;
	
	public List<ReqCategoryVO> findReqCategory(ReqCategoryVO reqCategoryVO)throws Exception;
}
