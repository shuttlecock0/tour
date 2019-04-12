package edu.autocar.service;

import edu.autocar.domain.Board;
import edu.autocar.domain.PageInfo;

public interface BoardService {
	PageInfo<Board> getPage(int page) throws Exception;
	Board getBoard(int boardId) throws Exception;
	void create(Board board) throws Exception;
	boolean update(Board board) throws Exception;
	boolean delete(int boardId, String password) throws Exception;
}
