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
	// �Խù� �� ����
	public int countBoard();

	// ����¡ ó�� �Խñ� ��ȸ
	public List<BoardDTO> selectBoard(PagingVO vo);
}
