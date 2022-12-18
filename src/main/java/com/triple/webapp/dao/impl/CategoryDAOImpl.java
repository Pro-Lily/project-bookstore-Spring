package com.triple.webapp.dao.impl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.triple.webapp.dao.CategoryDAO;
import com.triple.webapp.dto.CategoryDTO;

@Repository
public class CategoryDAOImpl implements CategoryDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String ns = "CategoryMapper.";
	
	@Override
	public List<CategoryDTO> selectAll() {
		List<CategoryDTO> list = sqlSession.selectList(ns+"selectAll"); 
		return list;
	}
}
