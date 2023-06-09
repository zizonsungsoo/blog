package test.spring.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import test.spring.component.BoardDTO;
import test.spring.component.Board_CommentDTO;
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
	@Override
	public int insertBoardComment(Board_CommentDTO dto) {
		return mapper.insertBoardComment(dto);
	}
	@Override
	public List<Board_CommentDTO> boardConmmentAll(String num) {
		return mapper.boardConmmentAll(num);
	}
	@Override
	public int countBoardComment(String num) {
		return mapper.countBoardComment(num);
	}
	@Override
	public int updateBoardComment(Board_CommentDTO dto) {
		return mapper.updateBoardComment(dto);
	}
	@Override
	public int deleteBoardComment(Board_CommentDTO dto) {
		return mapper.deleteBoardComment(dto);
	}
	
}
