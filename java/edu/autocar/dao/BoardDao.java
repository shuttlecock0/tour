package edu.autocar.dao;

import org.apache.ibatis.annotations.Param;

import edu.autocar.domain.Board;

public interface BoardDao extends CrudDao<Board, Integer> {
	void increaseReadCnt(Integer boardId) throws Exception;
	int delete(@Param("boardId") Integer boardId,
				@Param("password") String password) throws Exception;
}
