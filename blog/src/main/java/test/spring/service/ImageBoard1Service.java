package test.spring.service;

import test.spring.component.ImageBoard1DTO;

import java.util.List;

public interface ImageBoard1Service {

	public int boardListCount();
	
	public List boardList(String startRow, String endRow);
	
	public int myBoardListCount(String memId);
	
	public List myBoardList(String memId, String startRow, String endRow);
	
	public ImageBoard1DTO memContent(String memId);
	
	public void write(ImageBoard1DTO dto);
	
	public ImageBoard1DTO numContent(int num);
	
	public void addReadcount(int num, int count);
	
	public int subBoardListCount(int num);
	
	public List subBoardList(int num, String startRow, String endRow);
	
	public int maxNum();
	
	public void subWrite(ImageBoard1DTO dto);
	
	public void reUpdate(int ref, int re_step);
	
	public ImageBoard1DTO boardcontent(int num);
	
}
