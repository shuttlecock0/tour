package edu.autocar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import edu.autocar.dao.BoardDao;
import edu.autocar.domain.Board;
import edu.autocar.domain.PageInfo;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class BoardServiceImpl implements BoardService {

	final static private int PER_PAEGE_COUNT = 10;
	
	@Autowired
	BoardDao dao;
	
	@Override
	public PageInfo<Board> getPage(int page) throws Exception {
		int start = (page-1)*PER_PAEGE_COUNT;
		int end = start + PER_PAEGE_COUNT;
		int totalCount = dao.count();
		List<Board> list = dao.getPage(start, end);
		
		return new PageInfo<>(
				totalCount,
				(int)Math.ceil(totalCount/(double)PER_PAEGE_COUNT),
				page, PER_PAEGE_COUNT, list);
	}

	@Override
	@Transactional
	public Board getBoard(int boardId) throws Exception {
		dao.increaseReadCnt(boardId);
		return dao.findById(boardId);
	}

	@Override
	@Transactional
	public void create(Board board) throws Exception {
		dao.insert(board);
		//throw new Exception("게시글 등록 실패");
		//throw new RuntimeException("게시글 등록 실패");
	}

	@Override
	@Transactional
	public boolean update(Board board) throws Exception {
		return dao.update(board) == 1;
	}

	@Override
	@Transactional
	public boolean delete(int boardId, String password) throws Exception {
		return dao.delete(boardId, password) == 1;
	}
}