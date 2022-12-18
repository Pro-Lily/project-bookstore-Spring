package com.triple.webapp.dao;

import java.util.List;

import com.triple.webapp.dto.CategoryDTO;

public interface CategoryDAO {

	List<CategoryDTO> selectAll();

}
