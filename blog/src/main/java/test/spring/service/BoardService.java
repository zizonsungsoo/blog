package test.spring.service;

import java.util.List;

import test.spring.component.BoardDTO;
import test.spring.utils.PagingVO;

public interface BoardService {
	public int insert(BoardDTO dto);
	public List<BoardDTO> boardList();
	public int count();
	public int update(BoardDTO dto);
	public BoardDTO boardAll(String writer,String num);
	public int delete(String num,String password);
	public int updatereadcnt(String num);
	// 게시물 총 갯수
	public int countBoard();

	// 페이징 처리 게시글 조회
	public List<BoardDTO> selectBoard(PagingVO vo);
}
