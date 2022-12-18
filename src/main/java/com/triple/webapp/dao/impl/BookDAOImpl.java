package com.triple.webapp.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.triple.webapp.dao.BookDAO;
import com.triple.webapp.dto.BookDTO;
import com.triple.webapp.dto.PagerDTO;

@Repository
public class BookDAOImpl implements BookDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String ns = "BookMapper.";
	
	@Override
	public int insert(BookDTO book) {
		int rows = sqlSession.insert(ns+"insert", book); 
		return rows;
	}
	
	@Override
	public List<BookDTO> selectAll() {
		List<BookDTO> list = sqlSession.selectList(ns+"selectAll");
		return list;
	}
	
	@Override
	public List<BookDTO> selectCategory(int no) {
		List<BookDTO> list = sqlSession.selectList(ns+"selectCategory", no);
		return list;
	}
	
	@Override
	public BookDTO selectBookNo(int no) {
		BookDTO book = sqlSession.selectOne(ns + "selectBookNo", no);
		return book;
	}
	
	@Override
	public int update(BookDTO book) {
		int upload; 
		if(book.getBook_image() != null) {
			upload = sqlSession.update(ns+"update", book);
		} else {
			upload = sqlSession.update(ns+"updateNoImage", book);
		}
		return upload;
	}

	@Override
	public int deleteByNo(int no) {
		return sqlSession.delete(ns+"deleteByNo", no);
	}

	@Override
	public void updateCount(BookDTO bookDTO) {
		sqlSession.update(ns+"updateCount", bookDTO);
	}

	@Override
	public void insertCart(BookDTO bookDTO) {
		sqlSession.insert(ns+"insertCart", bookDTO);
	}
	
	@Override
	public List<BookDTO> selectByPage(PagerDTO pager) {
		return sqlSession.selectList(ns + "selectByPage", pager);
	}
	
	@Override
	public int countAll() {
		return sqlSession.selectOne(ns+"countAll");
	}
	
	@Override
	public int countAll(int no) {
		return sqlSession.selectOne(ns+"count", no);
	}
	
	@Override
	public List<BookDTO> selectCategoryByPage(int no, PagerDTO pager) {
		//Map<Object, Object> map = new HashMap<>();
		Map map = new HashMap();
		map.put("no", no);
		map.put("pager", pager);
		return sqlSession.selectList(ns + "selectCategoryByPage", map);
	}
}

