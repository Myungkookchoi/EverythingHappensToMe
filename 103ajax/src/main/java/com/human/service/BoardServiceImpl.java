package com.human.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human.dao.BoardDAO;
import com.human.dao.ReplyDAO;
import com.human.dto.BoardDTO;
import com.human.vo.PageMaker;

@Service
public class BoardServiceImpl implements BoardServic {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void write(BoardDTO board) throws Exception {
		System.out.println(sqlSession);
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		dao.create(board);
	}

	@Override
	public BoardDTO read(int bno) throws Exception {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);

		return dao.read(bno);
	}

	@Override
	public void modify(BoardDTO board) throws Exception {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		dao.update(board);
	}

	@Override
	public void remove(int bno) throws Exception {
		ReplyDAO rDao = sqlSession.getMapper(ReplyDAO.class);
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		rDao.deleteBno(bno);
		dao.delete(bno);

	}

	@Override
	public List<BoardDTO> listSearchCriteria(PageMaker pm) throws Exception {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		return dao.listSearch(pm);
	}

	@Override
	public int listSearchCount(PageMaker pm) throws Exception {
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		return dao.listSearchCount(pm);
	}

}
