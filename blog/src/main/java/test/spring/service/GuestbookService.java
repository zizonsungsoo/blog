package test.spring.service;
import java.util.List;

import test.spring.dto.guestbookDTO;

public interface GuestbookService {
	public void insert(guestbookDTO dto);

	public Object blogAll(guestbookDTO dto);

	public List<guestbookDTO> all();

	public void delete(int num);

	void update(int num, String content);

	
}
