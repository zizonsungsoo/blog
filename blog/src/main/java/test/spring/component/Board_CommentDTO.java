package test.spring.component;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
@Data
public class Board_CommentDTO {
	private int cno;	//��� ��ȣ
	private int num;	//�ش� �Խñ� ��ȣ
	private String cwriter;
	private String content;
	@DateTimeFormat(pattern="yyyy/MM/dd")
	private Date reg_date;
}
