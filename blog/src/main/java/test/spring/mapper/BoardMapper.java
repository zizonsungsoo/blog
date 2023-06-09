package test.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import test.spring.component.BoardDTO;
import test.spring.component.Board_CommentDTO;
import test.spring.utils.PagingVO;

public interface BoardMapper {
	public int insert(BoardDTO dto);
	public int update(BoardDTO dto);
	public BoardDTO boardAll(@Param("writer") String writer,@Param("num") String num);
	public int delete(@Param("num")String num ,@Param("password")String password );
	public int updatereadcnt(String num);
	// 게시물 총 갯수
	public int countBoard();
	// 페이징 처리 게시글 조회
	public List<BoardDTO> selectBoard(PagingVO vo);
	
	public int insertBoardComment(Board_CommentDTO dto);
	public List<Board_CommentDTO> boardConmmentAll(@Param("num") String num);
	public int countBoardComment(String num);
	public int updateBoardComment(Board_CommentDTO dto);
	public int deleteBoardComment(Board_CommentDTO dto);
}
