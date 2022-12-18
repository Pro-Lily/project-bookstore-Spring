package com.triple.webapp.service;

import java.util.List;

import com.triple.webapp.dto.BookDTO;
import com.triple.webapp.dto.CategoryDTO;
import com.triple.webapp.dto.PagerDTO;

public interface ShopService {

	List<CategoryDTO> categoryList();

	void bookWrite(BookDTO book);

	List<BookDTO> bookList();

	List<BookDTO> getBookList(int no);

	BookDTO getBookListDetail(int no);

	void bookUpdate(BookDTO book);

	void bookDelete(int no);

	void updateCount(BookDTO bookDTO);

	void insertCart(BookDTO bookDTO);

	List<BookDTO> bookList(PagerDTO pager);

	int getTotalRows();

	List<BookDTO> getBookList(int no, PagerDTO pager);

	int getTotalRows(int no);


}
