package com.triple.webapp.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.triple.webapp.dto.BookDTO;
import com.triple.webapp.dto.CategoryDTO;
import com.triple.webapp.dto.PagerDTO;
import com.triple.webapp.service.ShopService;

@Controller
@RequestMapping("/shop")
public class ShopController {
	private static final Logger logger = LoggerFactory.getLogger(ShopController.class);

	@Resource
	ShopService service;
	
	/* -------------------- 전체 도서 목록 뿌려주기 -------------------- */
	@RequestMapping("/content")
	public String content(Model model) {	
		List<CategoryDTO> category_list = service.categoryList();
		model.addAttribute("category_list", category_list);

		return "shop/content";
	}
	
	@GetMapping("/bookPageList")
	public String bookPageList(@RequestParam(defaultValue = "1") int pageNo, Model model) {	
		int totalRows = service.getTotalRows();	
		PagerDTO pager = new PagerDTO(12, 5, totalRows, pageNo); 
		
		List<BookDTO> book_list = service.bookList(pager);
		model.addAttribute("book_list", book_list);
		model.addAttribute("pager", pager);
		
		return "shop/bookPageList";
	}
	
	@GetMapping("/photodownload")
	public void photodownload(String fileName, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		String saveFilePath = "C:/triple_project/photo/book/" + fileName;
		InputStream is = new FileInputStream(saveFilePath);
	
		String fileType = request.getServletContext().getMimeType(fileName);
		response.setContentType(fileType);
		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");

		int fileSize = (int) new File(saveFilePath).length(); 
		response.setContentLength(fileSize);
		OutputStream os = response.getOutputStream();
		FileCopyUtils.copy(is, os);
		os.flush();
		os.close();
		is.close();
	}
	/* -------------------- 전체 도서 목록 뿌려주기 -------------------- */
	
	
	/* -------------------- 서점 상품등록 시작 -------------------- */
	@GetMapping("/bookWrite")
	public String bookWrite(Model model) {
		List<CategoryDTO> category_list = service.categoryList();
		model.addAttribute("category_list", category_list);
		
		return "shop/bookWriteForm";
	}
	
	@RequestMapping("bookWrite")
	public void bookPosting(Model model, MultipartFile attach, BookDTO book, HttpServletResponse response) throws Exception {			
		if (!attach.isEmpty()) {
			String saveFileName = new Date().getTime() + "_" + attach.getOriginalFilename();
			attach.transferTo(new File("C:/triple_project/photo/book/" + saveFileName));	
			book.setBook_image(saveFileName);
		}
		
		// System.out.println(book.toString());
		
		service.bookWrite(book);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		String json = jsonObject.toString();

		PrintWriter out = response.getWriter();
		response.setContentType("application/json; charset=utf-8");
		out.println(json);
		out.flush();
		out.close();
	}
	
	@RequestMapping("/upload")
	public void upload(MultipartFile upload, HttpServletRequest request, HttpServletResponse response) throws Exception {
		JSONObject jsonObject = new JSONObject();
		if(!upload.isEmpty()) {
			String originalFileName = upload.getOriginalFilename();
			originalFileName += new Date().getTime() + "-" + originalFileName;
			File saveFile = new File("C:/triple_project/photo/book/bookContent/" + originalFileName);
			upload.transferTo(saveFile);
			jsonObject.put("uploaded", 1);
			jsonObject.put("fileName", originalFileName);
			jsonObject.put("url", "http://localhost:8080/triple/shop/bookImageDownload?fileName=" + originalFileName);
		} 
		String json = jsonObject.toString();
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(json);
		out.flush();
		out.close();
	}
	
	@GetMapping("/bookImageDownload")
	public void bookImageDownload(String fileName, HttpServletResponse response, HttpServletRequest request) throws Exception {
		String saveFilePath = "C:/triple_project/photo/book/bookContent/" + fileName;
		InputStream is = new FileInputStream(saveFilePath);

		String fileType = request.getServletContext().getMimeType(fileName);
		response.setContentType(fileType);

		OutputStream os = response.getOutputStream();
		FileCopyUtils.copy(is, os);
		os.flush();
		os.close();
		is.close();
	}	
	
	/* -------------------- 서점 상품등록 끝 -------------------- */
	
	/* -------------------- 카테고리별 도서 목록 시작 -------------------- */ 
	@RequestMapping("/bookList")
	public String bookList(int no, Model model, @RequestParam(defaultValue = "1") int pageNo) {		
		int totalRows = service.getTotalRows(no);	
		PagerDTO pager = new PagerDTO(12, 5, totalRows, pageNo); 
		model.addAttribute("pager", pager);
		
		List<BookDTO> list = service.getBookList(no, pager);
		model.addAttribute("list", list);
		model.addAttribute("no", no);
		
		return "shop/bookList";
	}
	/* -------------------- 카테고리별 도서 목록 끝 -------------------- */ 
		
	/* -------------------- 책 디테일 시작 -------------------- */
	@GetMapping("/book_detail")
	public String bookListDetail(int no, Model model) {
		BookDTO book = service.getBookListDetail(no);
		model.addAttribute("book", book);
		
		return "shop/book_detail";
	}
	/* -------------------- 책 디테일 끝 -------------------- */
	
	/* -------------------- 상품 내용 업데이트 시작 -------------------- */
	@GetMapping("/bookUpdate")
	public String bookUpdateForm(BookDTO book, Model model, int no) {
		List<CategoryDTO> category_list = service.categoryList();
		model.addAttribute("category_list", category_list);
		
		book = service.getBookListDetail(no);
		model.addAttribute("book", book);
		
		return "shop/bookUpdateForm";
	}
	
	@PostMapping("/bookUpdate")
	public void bookUpdate(Model model, MultipartFile attach, BookDTO book, HttpServletResponse response) throws Exception {
		if (attach != null && !attach.isEmpty()) {
			String saveFileName = new Date().getTime() + "_" + attach.getOriginalFilename();
			attach.transferTo(new File("C:/triple_project/photo/book/" + saveFileName));
			book.setBook_image(saveFileName);
		}
		
		//System.out.println("DTO=" + book.toString());
		service.bookUpdate(book);
		
		JSONObject jsonObject = new JSONObject(); 
		jsonObject.put("result", "success");
		String json = jsonObject.toString(); 

		PrintWriter out = response.getWriter();
		response.setContentType("application/json; charset=utf-8");
		out.println(json);
		out.flush();
		out.close();
	}
	/* -------------------- 상품 내용 업데이트 끝 -------------------- */
	
	/* -------------------- 상품 게시물 삭제 시작 -------------------- */
	@PostMapping("/bookDelete")
	public void bookDelete(int no, HttpServletResponse response) throws IOException{
		// 게시물 삭제
		service.bookDelete(no);

		// JSON 생성
		JSONObject jsonObject = new JSONObject(); 
		jsonObject.put("result", "success");
		String json = jsonObject.toString(); 

		// JSON 응답 보내기
		PrintWriter out = response.getWriter();
		response.setContentType("application/json; charset=utf-8");
		out.println(json);
		out.flush();
		out.close();
	}
	/* -------------------- 상품 게시물 삭제 끝 -------------------- */
	
	@RequestMapping("/updateAndCart")
	public String updateCart() {
		return "redirect:/signin/content";
	}
	
	@RequestMapping(value="/updateAndCart/{id}", method = RequestMethod.POST)
	public String updateAndCart(@PathVariable(value="id") String id, BookDTO bookDTO, Model model) {
		service.updateCount(bookDTO);
		System.out.println(bookDTO.toString());
		service.insertCart(bookDTO);
		return "redirect:/cart/cart_detail/" + id;
	}
}
