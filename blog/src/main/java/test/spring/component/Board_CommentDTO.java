package test.spring.component;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
@Data
public class Board_CommentDTO {
	private int cno;	//댓글 번호
	private int num;	//해당 게시글 번호
	private String cwriter;
	private String content;
	@DateTimeFormat(pattern="yyyy/MM/dd")
	private Date reg_date;
}
