package com.triple.webapp.dao;

import java.util.List;

import com.triple.webapp.dto.BookDTO;
import com.triple.webapp.dto.PagerDTO;

public interface BookDAO {

	public int insert(BookDTO book);

	public List<BookDTO> selectAll();

	public List<BookDTO> selectCategory(int no);

	public BookDTO selectBookNo(int no);

	public int update(BookDTO book);

	public int deleteByNo(int no);

	public void updateCount(BookDTO bookDTO);

	public void insertCart(BookDTO bookDTO);

	public List<BookDTO> selectByPage(PagerDTO pager);

	public int countAll();

	public List<BookDTO> selectCategoryByPage(int no, PagerDTO pager);

	public int countAll(int no);

}
