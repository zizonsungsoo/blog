package test.spring.component;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
@Data
public class BoardDTO {
	public int num;
	public String writer;
	public String subject;
	public String email;
	public String content;
	public String password;
	@DateTimeFormat(pattern="yyyy/MM/dd")
	private Date reg_date;
	private int readcount;
	private int ref;
	private int re_step;
	private int re_number;
}
