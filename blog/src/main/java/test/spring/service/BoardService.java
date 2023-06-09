package test.spring.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import test.spring.component.BoardDTO;
import test.spring.component.Board_CommentDTO;
import test.spring.utils.PagingVO;

public interface BoardService {
	public int insert(BoardDTO dto);
	public int update(BoardDTO dto);
	public BoardDTO boardAll(String writer,String num);
	public int delete(String num,String password);
	public int updatereadcnt(String num);
	// �Խù� �� ����
	public int countBoard();

	// ����¡ ó�� �Խñ� ��ȸ
	public List<BoardDTO> selectBoard(PagingVO vo);
	//��� 
	public int insertBoardComment(Board_CommentDTO dto);
	public List<Board_CommentDTO> boardConmmentAll(String num);
	public int countBoardComment(String num);
	public int updateBoardComment(Board_CommentDTO dto);
}
