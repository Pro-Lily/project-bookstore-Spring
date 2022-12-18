package com.triple.webapp.dto;

public class PagerDTO {
	private int totalRows; // 전체 행수
	private int totalPageNo; // 전체 페이지 수
	private int totalGroupNo; // 전체 그룹 수 [1,2,3,4,5] [6,7,8,9,10] -> 2개 그룹
	private int startPageNo; // 그룹의 시작 페이스 번호
	private int endPageNo; // 그룹의 끝 페이지 번호
	private int pageNo; // 현재 페이지 번호
	private int pagesPerGroup; // 그룹당 페이지 수
	private int groupNo; // 현재 그룹 번호
	private int rowsPerPage; // 페이지당 행 수
	private int startRowNo; // 페이지의 시작 행 번호
	private int endRowNo; // 페이지의 끝 행 번호

	public PagerDTO(int rowsPerPage, int pagesPerGroup, int totalRows, int pageNo) {
		this.rowsPerPage = rowsPerPage; // 한 페이지당 나오는 게시물 수
		this.pagesPerGroup = pagesPerGroup; // 그룹당 몇개의 페이지를 보이게 할꺼냐
		this.totalRows = totalRows; // 실제 DB안에 있는 전체 행수 ( 전체 게시물 수 )
		this.pageNo = pageNo; // 원하는 페이지 번호

		totalPageNo = totalRows / rowsPerPage; // 총 100개 게시물, 10개씩 보일 때 -> totalPageNo = 10
		if (totalRows % rowsPerPage != 0) totalPageNo++; // 나머지가 있으면 totalPageNo = 10 + 1

		totalGroupNo = totalPageNo / pagesPerGroup; // ex. (totalPageNo=10 / pagerPerGroup=5)
		if (totalPageNo % pagesPerGroup != 0) totalGroupNo++;

		groupNo = (pageNo - 1) / pagesPerGroup + 1; // 현재 그룹의 번호 [1,2,3,4,5] = 1, [6,7,8,9,10] = 2

		startPageNo = (groupNo - 1) * pagesPerGroup + 1; // 해당 그룹의 시작 번호

		endPageNo = startPageNo + pagesPerGroup - 1; // 해당 그룹의 마지막 번호
		if (groupNo == totalGroupNo)
			endPageNo = totalPageNo;

		startRowNo = (pageNo - 1) * rowsPerPage + 1;
		endRowNo = pageNo * rowsPerPage;
	}

	public int getTotalRows() {
		return totalRows;
	}

	public int getTotalPageNo() {
		return totalPageNo;
	}

	public int getTotalGroupNo() {
		return totalGroupNo;
	}

	public int getStartPageNo() {
		return startPageNo;
	}

	public int getEndPageNo() {
		return endPageNo;
	}

	public int getPageNo() {
		return pageNo;
	}

	public int getPagesPerGroup() {
		return pagesPerGroup;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public int getRowsPerPage() {
		return rowsPerPage;
	}

	public int getStartRowNo() {
		return startRowNo;
	}

	public int getEndRowNo() {
		return endRowNo;
	}
}
