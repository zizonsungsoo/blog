package test.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import test.spring.component.BoardDTO;
import test.spring.utils.PagingVO;

public interface BoardMapper {
	public int insert(BoardDTO dto);
	public List<BoardDTO> boardList();
	public int count();
	public int update(BoardDTO dto);
	public BoardDTO boardAll(@Param("writer") String writer,@Param("num") String num);
	public int delete(@Param("num")String num ,@Param("password")String password );
	public int updatereadcnt(String num);
	// �Խù� �� ����
	public int countBoard();

	// ����¡ ó�� �Խñ� ��ȸ
	public List<BoardDTO> selectBoard(PagingVO vo);
}
