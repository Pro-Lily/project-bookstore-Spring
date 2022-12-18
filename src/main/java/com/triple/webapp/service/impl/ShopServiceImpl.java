package com.triple.webapp.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.triple.webapp.dao.BookDAO;
import com.triple.webapp.dao.CategoryDAO;
import com.triple.webapp.dto.BookDTO;
import com.triple.webapp.dto.CategoryDTO;
import com.triple.webapp.dto.PagerDTO;
import com.triple.webapp.service.ShopService;

@Service
public class ShopServiceImpl implements ShopService {
	
	@Resource
	CategoryDAO categoryDao;
	
	@Resource
	BookDAO bookDao;
	
	@Override
	public List<CategoryDTO> categoryList() {
		List<CategoryDTO> list = categoryDao.selectAll();
		return list;
	}
	
	@Override
	public void bookWrite(BookDTO book) {
		bookDao.insert(book);
	}
	
	@Override
	public List<BookDTO> bookList() {
		List<BookDTO> list = bookDao.selectAll();
		return list;
	}
	
	@Override
	public List<BookDTO> getBookList(int no) {
		List<BookDTO> list = bookDao.selectCategory(no);
		return list;
	}
	
	@Override
	public BookDTO getBookListDetail(int no) {
		BookDTO book = bookDao.selectBookNo(no);
		return book;
	}
	
	@Override
	public void bookUpdate(BookDTO book) {
		bookDao.update(book);
	}
	
	@Override
	public void bookDelete(int no) {
		bookDao.deleteByNo(no);
	}

	@Override
	public void updateCount(BookDTO bookDTO) {
		bookDao.updateCount(bookDTO);
	}

	@Override
	public void insertCart(BookDTO bookDTO) {
		bookDao.insertCart(bookDTO);
	}
	
	@Override
	public List<BookDTO> bookList(PagerDTO pager) {
		List<BookDTO> list = bookDao.selectByPage(pager);
		return list;
	}
	
	@Override
	public int getTotalRows() {
		return bookDao.countAll();
	}
	
	@Override
	public List<BookDTO> getBookList(int no, PagerDTO pager) {
		List<BookDTO> list = bookDao.selectCategoryByPage(no, pager);
		return list;
	}
	
	@Override
	public int getTotalRows(int no) {
		return bookDao.countAll(no);
	}
}
