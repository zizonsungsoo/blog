package test.spring.component;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
@Data
public class BoardDTO {
	private int num;
	private String writer;
	private String subject;
	private String email;
	private String content;
	private String password;
	@DateTimeFormat(pattern="yyyy/MM/dd")
	private Date reg_date;
	private int readcount;
	private int ref;
	private int re_step;
	private int re_number;
}
