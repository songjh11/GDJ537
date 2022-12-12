package com.app.home.board.comment;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommentDAO {

	public int setCommentAdd(CommentVO commentVO)throws Exception;

	public List<CommentVO> getCommentList(CommentPager commentPager)throws Exception;

	public Long getCommentListTotalCount(CommentPager commentPager)throws Exception;

	public int setCommentUpdate(CommentVO commentVO)throws Exception;

	public int setCommentDelete(CommentVO commentVO)throws Exception;

	public CommentVO getCommentDetail(CommentVO commentVO)throws Exception;

}
