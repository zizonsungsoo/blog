package test.spring.component;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Image_board2DTO {
	
	private int num;
	private String id;
	private String title;
	private String content;
	private String image;
	private int readcount;
	@DateTimeFormat(pattern="yyyy/MM/dd")
	private Date time;

}
