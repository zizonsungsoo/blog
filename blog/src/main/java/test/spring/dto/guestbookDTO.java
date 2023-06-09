package test.spring.dto;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class guestbookDTO {
	private int num;
	private String writer;
	private String content;
	private String pw;
	
	@DateTimeFormat(pattern = "yy/MM/dd HH:mm")
	private Date time;
}
