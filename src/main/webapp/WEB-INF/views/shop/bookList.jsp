<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<c:forEach var="list" items="${list}">
	<div class="col-lg-3 col-md-6 col-sm-12">
		<div id="content_item" style="width: 100%;">
			<div class="item" align="center">
				<div class="item_photo">
					<a href="javascript:bookDetail(${list.book_no})">
						<img src="photodownload?fileName=${list.book_image}" width="260"
							height="300" />
					</a>
				</div>
			</div>
			<div class="item_info">
				<div class="item_name">
					<a href="javascript:bookDetail(${list.book_no})">
						<strong>${list.book_title}</strong>
					</a>
				</div>
				<div class="item_writer">
					<a href="javascript:bookDetail(${list.book_no})">
						<strong>${list.author}</strong>
					</a>
				</div>
				<div class="item_price">
					<span>${list.price}원</span>
				</div>
			</div>
		</div>
	</div>
</c:forEach>

<div class="pagination" style="width: 100%; margin-top: 20px;">
	<div class="pagination_rounded" style="margin: 20px auto 0 auto;">
	    <ul>
	    	<li> <a href="javascript:PageCategoryList(${no}, 1)" class="prev"> <i class="fa fa-angle-left" aria-hidden="true"></i> 처음 </a> </li>
		    <li>
		        <c:if test="${pager.groupNo > 1}">
		        	<a href="javascript:PageCategoryList(${no}, ${pager.startPageNo-1 })" class="prev"> 
		        		<i class="fa fa-angle-left" aria-hidden="true"></i> 이전 
		        	</a> 
		        </c:if>
		    </li>
	        <c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo }">
				<c:if test="${pager.pageNo == i}">
					<li class="hidden-xs"><a href="javascript:PageCategoryList(${no}, ${i})">${i}</a></li>
				</c:if>
				<c:if test="${pager.pageNo != i}">
					<li class="hidden-xs"><a href="javascript:PageCategoryList(${no}, ${i})">${i}</a></li>
				</c:if>
			</c:forEach>
			<li>
				<c:if test="${pager.groupNo < pager.totalGroupNo}">
		        	<a href="javascript:PageCategoryList(${no}, ${pager.endPageNo+1})" class="next"> 다음 <i class="fa fa-angle-right" aria-hidden="true"></i></a>
		        </c:if>
	        </li>
	        <li><a href="javascript:PageCategoryList(${no}, ${pager.totalPageNo})" class="next"> 맨끝 <i class="fa fa-angle-right" aria-hidden="true"></i></a> </li>
	    </ul>
	</div> 
</div>