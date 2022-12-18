package com.triple.webapp.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.triple.webapp.dto.CategoryDTO;
import com.triple.webapp.dto.ScriptDTO;
import com.triple.webapp.service.ScriptService;
import com.triple.webapp.service.ShopService;

@Controller
@RequestMapping("script")
public class ScriptController {

	@Inject
	private ScriptService scriptService;
	@Inject
	private ShopService shopService;

	// 원고 목록
	@RequestMapping("/script_list")
	public String script_list() {
		return "redirect:/script/script_list/1";
	}
	
	// 원고 목록 페이징
	@RequestMapping("/script_list/{pg}")
	public String script_list1(@PathVariable(value="pg") int pg, Model model) {
		int size = 10; // 글의 수(한 페이지 기준)
		int begin = (pg - 1) * size + 1; // 2-1 => 1 * 10 => 10 + 1 => 11
		int end = begin + (size - 1); // 11 + (10-1) => 11 + 9 => 20
		int count = scriptService.countScript();
		
		int totalPage = count / size + (count % size == 0 ? 0 : 1);
		int pageSize = 10; // 페이지 링크 갯수, [11], [12], [13], [14], [15], [16], [17], [18], [19], [20] 
		
		// 20은 예외라서 이런 공식을 사용
		int startPage = ((pg-1) / pageSize * pageSize) + 1; // ((20-1) / 10 * 10) + 1 = 11
		int endPage = startPage + (pageSize-1); // 11 + (10-1) => 11 + 9 => 20
		if(endPage > totalPage) { // 20 > 17
			endPage = totalPage; // 17
		}
		int max = count - ((pg-1) * size); // 각 페이지의 최대 글번호, 103 - (1-1) * 10) => 103, 103 - (2-1) * 10) => 103 - 10 => 93
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end", end);
		List<ScriptDTO> list = scriptService.listScript(map);
		// model 에 정보들을 담는다.
		model.addAttribute("script_list", list);
		model.addAttribute("pg", pg);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("max", max);
		return "script/script_list";
	}

	// 원고 등록 폼
	@RequestMapping("/script_write_form")
	public String script_write_form(Model model) {
		List<CategoryDTO> category_list = shopService.categoryList();
		model.addAttribute("category_list", category_list);
		return "script/script_write_form";
	}

	// 원고 등록하기
	@RequestMapping(value = "/script_write", method = RequestMethod.POST)
	public String script_write(ScriptDTO scriptDTO) throws IOException {
		// 파일 업로드 처리
		String fileName = null;
		MultipartFile uploadFile = scriptDTO.getUploadFile();
		if (!uploadFile.isEmpty()) {
			String originalFileName = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName); // 확장자 구하기
			UUID uuid = UUID.randomUUID(); // UUID 구하기
			fileName = "TripleScript_" + uuid + "." + ext;
//			fileName = originalFileName;
			uploadFile.transferTo(new File("C:/triple_project/photo/script/" + fileName));
		}
		scriptDTO.setScript_image(fileName);
		scriptService.insertScript(scriptDTO);
		return "redirect:/script/script_list";
	}
	
	// 원고 상세 보기
	@RequestMapping("/script_detail/{script_no}/{pg}")
	public String script_detail(@PathVariable(value="script_no") int script_no, @PathVariable(value="pg") int pg, Model model) {
		ScriptDTO scriptDTO = scriptService.readScript(script_no);
		model.addAttribute("b", scriptDTO);
		model.addAttribute("pg", pg);
		return "script/script_detail";
	}
	
	// 원고 파일 다운로드
	@RequestMapping("fileDownload")
    public void fileDownload4(HttpServletRequest request, HttpServletResponse response) throws Exception {
//        String path =  request.getSession().getServletContext().getRealPath("/Users/jeongdongjin/Documents/");
        
        String filename =request.getParameter("fileName");
        String realFilename="";
        System.out.println(filename);
         
        try {
            String browser = request.getHeader("User-Agent"); 
            //파일 인코딩 
            if (browser.contains("MSIE") || browser.contains("Trident") || browser.contains("Chrome")) {
                filename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
            } else {
                filename = new String(filename.getBytes("UTF-8"), "ISO-8859-1");
            }
        } catch (UnsupportedEncodingException ex) {
            System.out.println("UnsupportedEncodingException");
        }
        realFilename = "C:/triple_project/photo/script/" + filename;
        System.out.println(realFilename);
        File file1 = new File(realFilename);
        if (!file1.exists()) {
            return ;
        }
         
        // 파일명 지정        
        response.setContentType("application/octer-stream");
        response.setHeader("Content-Transfer-Encoding", "binary;");
        response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
        try {
            OutputStream os = response.getOutputStream();
            FileInputStream fis = new FileInputStream(realFilename);
 
            int ncount = 0;
            byte[] bytes = new byte[512];
 
            while ((ncount = fis.read(bytes)) != -1 ) {
                os.write(bytes, 0, ncount);
            }
            fis.close();
            os.close();
        } catch (Exception e) {
            System.out.println("FileNotFoundException : " + e);
        }
	}
	
	// 원고 삭제
    @RequestMapping(value="/script_delete", method=RequestMethod.POST)
    public String delete(ScriptDTO scriptDTO, @RequestParam(value="pg", defaultValue="1") int pg, Model model) {
    	int ok = scriptService.deleteScript(scriptDTO);
    	if(ok == 1) {
    		return "redirect:/script/script_list/" + pg;
    	} else {
    		return "redirect:/";
    	}
    }
	
    
    // 원고 수정
    @RequestMapping("/script_updateform/{script_no}/{pg}")
	public String updateform(@PathVariable(value="script_no") int script_no, @PathVariable(value="pg") int pg, Model model) {
    	ScriptDTO scriptDTO = scriptService.readScript(script_no);
    	List<CategoryDTO> category_list = shopService.categoryList();
		model.addAttribute("category_list", category_list);
		model.addAttribute("b", scriptDTO);
		model.addAttribute("pg", pg);
		return "script/script_updateform";
	}
    
    @RequestMapping(value="/update", method=RequestMethod.POST)
	public String updateString(ScriptDTO scriptDTO, @RequestParam(value="pg", defaultValue="1") int pg, Model model) throws IOException {
    	// 파일 업로드 처리
		String fileName = null;
		MultipartFile uploadFile = scriptDTO.getUploadFile();
		if (!uploadFile.isEmpty()) {
			String originalFileName = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName); // 확장자 구하기
			UUID uuid = UUID.randomUUID(); // UUID 구하기
			fileName = uuid + "." + ext;
			uploadFile.transferTo(new File("/Users/jeongdongjin/Documents/" + fileName));
		}
		scriptDTO.setScript_image(fileName);
		int ok = scriptService.updateScript(scriptDTO);
		if(ok == 1) {
			return "redirect:/script/script_list/" + pg;
		} else { 
			return "redirect:/";
		}
	}
}
