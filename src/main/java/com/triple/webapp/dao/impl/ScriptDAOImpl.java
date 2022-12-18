package com.triple.webapp.dao.impl;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.triple.webapp.dao.ScriptDAO;
import com.triple.webapp.dto.ScriptDTO;

@Repository
public class ScriptDAOImpl implements ScriptDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String ns = "ScriptMapper.";

	@Override
	public void insertScript(ScriptDTO scriptDTO) {
		sqlSession.insert(ns+"insertScript", scriptDTO);
	}

	@Override
	public int countScript() {
		return sqlSession.selectOne(ns+"countScript");
	}

	@Override
	public List<ScriptDTO> listScript(HashMap<String, Integer> map) {
		return sqlSession.selectList(ns+"listScript", map);
	}

	@Override
	public void updateHit(int script_no) {
		sqlSession.update(ns+"updateHit", script_no);
	}

	@Override
	public ScriptDTO getScript(int script_no) {
		return sqlSession.selectOne(ns+"getScript", script_no);
	}

	@Override
	public int deleteScript(ScriptDTO scriptDTO) {
		return sqlSession.delete(ns+"deleteScript", scriptDTO);
	}

	@Override
	public List<ScriptDTO> getMyScripts(HashMap<String, String> map) {
		return sqlSession.selectList(ns+"getMyScripts",map);
	}

	public int updateScript(ScriptDTO scriptDTO) {
		return sqlSession.update(ns+"updateScript", scriptDTO);
	}
}
