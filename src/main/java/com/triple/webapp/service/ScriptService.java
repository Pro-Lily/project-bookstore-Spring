package com.triple.webapp.service;

import java.util.HashMap;
import java.util.List;

import com.triple.webapp.dto.ScriptDTO;

public interface ScriptService {

	void insertScript(ScriptDTO scriptDTO);

	int countScript();

	List<ScriptDTO> listScript(HashMap<String, Integer> map);

	ScriptDTO readScript(int script_no);

	int deleteScript(ScriptDTO scriptDTO);

	List<ScriptDTO> getMyScripts(HashMap<String, String> map);

	int updateScript(ScriptDTO scriptDTO);

}
