package test.spring.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import test.spring.component.BoardDTO;
import test.spring.mapper.BoardMapper;
import test.spring.utils.PagingVO;


@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardMapper mapper;

	@Override
	public int insert(BoardDTO dto) {
		return mapper.insert(dto);
	}
	@Override
	public List<BoardDTO> boardList() {
		return mapper.boardList();
	}
	@Override
	public int count() {
		return mapper.count();
	}
	@Override
	public int update(BoardDTO dto) {
		return mapper.update(dto);
	}
	@Override
	public BoardDTO boardAll(String writer,String num) {
		return mapper.boardAll(writer,num);
	}
	@Override
	public int delete(String num,String password) {
		return mapper.delete(num,password);
	}
	@Override
	public int updatereadcnt(String num) {
		return mapper.updatereadcnt(num);
	}
	@Override
	public int countBoard() {
		return mapper.countBoard();
	}
	@Override
	public List<BoardDTO> selectBoard(PagingVO vo) {
		return mapper.selectBoard(vo);
	}
	
}
