package com.app.home.board.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentService {

	@Autowired
	private CommentDAO commentDAO;

	public List<CommentVO> getCommentList(CommentPager commentPager) throws Exception {

		Long totalCount = commentDAO.getCommentListTotalCount(commentPager);
		commentPager.getRownum();
		commentPager.getnum(totalCount);

		return commentDAO.getCommentList(commentPager);
	}

	//댓글추가
	public int setCommentAdd(CommentVO commentVO)throws Exception {
		return commentDAO.setCommentAdd(commentVO);
	}
	//댓글수정
	int setCommentUpdate(CommentVO commentVO) throws Exception {
		return commentDAO.setCommentUpdate(commentVO);
	}
	//댓글삭제
	int setCommentDelete(CommentVO commentVO) throws Exception {
		return commentDAO.setCommentDelete(commentVO);
	}

	public CommentVO getCommentDetail(CommentVO commentVO) throws Exception {
		return commentDAO.getCommentDetail(commentVO);
	}

}
