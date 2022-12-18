package com.triple.webapp.dao;

import java.util.HashMap;
import java.util.List;

import com.triple.webapp.dto.ScriptDTO;

public interface ScriptDAO {

	List<ScriptDTO> listScript = null;

	void insertScript(ScriptDTO scriptDTO);

	int countScript();

	List<ScriptDTO> listScript(HashMap<String, Integer> map);

	void updateHit(int script_no);

	ScriptDTO getScript(int script_no);

	int deleteScript(ScriptDTO scriptDTO);

	List<ScriptDTO> getMyScripts(HashMap<String, String> map);

	int updateScript(ScriptDTO scriptDTO);

}
