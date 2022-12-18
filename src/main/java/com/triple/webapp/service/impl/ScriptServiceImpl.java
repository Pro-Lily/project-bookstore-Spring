package com.triple.webapp.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.triple.webapp.dao.ScriptDAO;
import com.triple.webapp.dto.ScriptDTO;
import com.triple.webapp.service.ScriptService;

@Service
public class ScriptServiceImpl implements ScriptService {
	
	@Inject
	private ScriptDAO scriptDAO;

	@Override
	public void insertScript(ScriptDTO scriptDTO) {
		scriptDAO.insertScript(scriptDTO);
	}

	@Override
	public int countScript() {
		return scriptDAO.countScript();
	}

	@Override
	public List<ScriptDTO> listScript(HashMap<String, Integer> map) {
		return scriptDAO.listScript(map);
	}

	@Override
	public ScriptDTO readScript(int script_no) {
		scriptDAO.updateHit(script_no); // 조회수 증가
		return scriptDAO.getScript(script_no); // 글읽기
	}

	@Override
	public int deleteScript(ScriptDTO scriptDTO) {
		return scriptDAO.deleteScript(scriptDTO);
	}

	@Override

	public List<ScriptDTO> getMyScripts(HashMap<String, String> map) {
		return scriptDAO.getMyScripts(map);
	}

	public int updateScript(ScriptDTO scriptDTO) {
		return scriptDAO.updateScript(scriptDTO);
	}
}
