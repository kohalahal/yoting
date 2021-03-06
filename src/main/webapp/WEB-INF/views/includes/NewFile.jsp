<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix='fn'%>
<% 
Long userNo = null;
boolean loggedIn = false;
if(session!=null) {
 Object tmp = session.getAttribute("userNo");
 if(tmp!=null) {
    userNo = (Long)tmp; 
    loggedIn = true;
 }
}
%>
<style>
    body {
        margin: 0px auto;
        background: #f7f3e8;
    }

    .gnb header {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
    }
    
    ul {
        text-align: right;
        margin: 0px auto;
        padding: 0px;
    }

    li {
        list-style: none;
        display: inline;
    }

    div[data-group="mid"] {
        display: inline-block;
        padding-right: 50px;
    }

    #header_inner {
        padding-right: 20px;
    }

    #header_mid {
        width: 1000px;
        min-width: 1000px;
        margin: 0px auto;
        padding-left: 20px;
        padding-right: 20px;
    }

    div[data-group="main"] {
        width: 1000px;
        min-width: 1000px;
        margin: 0px auto;
        padding-left: 20px;
        padding-right: 20px;
        /* background-color: yellowgreen; */
    }

    .header_innerBottom {
        margin-right: 20px;
        margin-left: 20px;
    }

    .navBottom {
        padding-top: 15px;
        padding-left: 200px;
        padding-right: 150px;
        display:inline-flex;
    }

    .navBottom li a{
        text-decoration:none;
        color:#4d4d4d;
        font-size:21px;
        display:block;
        padding:5px 10px;
        position:relative;
        text-transform:uppercase;
        margin:0 10px;
        transition: all .5s;
    } 
    #nav:hover{
        background-color:orange;
        color:white;
    }
    #nav:before{
        content:'';
        position:absolute;
        bottom:12px;
        left:12px;
        width:12px;
        height:12px;
        border:3px solid orange;
        border-width:0 0 3px 3px;
        opacity:0;
        transition:all 0.3s;
    }
    #nav:hover:before{
        opacity:1;
        bottom:-7px;
        left:-7px;
    }
    #nav:after{
        content:'';
        position:absolute;
        top:12px;
        right:12px;
        width:12px;
        height:12px;
        border:3px solid orange;
        border-width:3px 3px 0 0;
        opacity:0;
        transition: all 0.3s;
    }
    #nav:hover:after{
        opacity:1;
        top:-7px;
        right:-7px;
    }

/*로그인,서비스 버튼  */
.button {
  background-color: orange; 
  border-radius: 4px;
  border: 3px gray;
  color: black;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 12px;
}

</style>

    
<body>
    <!--헤더-->
    <div class="gnb_header">
        <div class="header_innerTop">
            <ul id="header_inner">
               <li><a href="user/registration"><button class='button'>가입하기</button></a></li>
                <li><button onclick="location.href='/user/login'"class='button'>로그인</button></li>
                <li><button class='button'>서비스 목록</button></li>
            </ul>
        </div>
        <div id="header_mid"  data-group="main">
        <!--로고-->
        <div class="header_innerLeft" data-group="mid">
            <div id="mid_logo"><a href="/user/index">
                <img src="https://i.ibb.co/dQT4pVx/cook-logo.png" style="width: 240px; height: 60px; margin-left: 60px;"></a>
            </div>
        </div>
        <div class="header_innerMid"  data-group="mid">
            <!--검색창-->
            <div class="mid_search_wrapper">
            <div id="searchBar">
<form id='searchForm' action="/search/result" method='get'>
   <select name='type'>
      <option value="A" <c:out value="${pageMaker.cri.type eq 'A' ? 'selected' : '' }"/>>통합검색</option>
      <option value="T" <c:out value="${pageMaker.cri.type eq 'T' ? 'selected' : '' }"/>>제목</option>
      <option value="W" <c:out value="${pageMaker.cri.type eq 'W' ? 'selected' : '' }"/>>작성자</option>
      <option value="Tag" <c:out value="${pageMaker.cri.type eq 'Tag' ? 'selected' : '' }"/>>태그</option>
   </select>
   <input type='text' name='keyword' id="keyword" placeholder="레시피를 검색하세요!" 
   value='<c:out value="${pageMaker.cri.keyword}"/>' style='width: 280px;'>
   <input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>'/>
   <button class='btn btn-default'>검색</button>
</form>
</div>
                <div class="search_keyword"
						style="display: inline; font-size: 15px;">
						<ul id="keywordDiv_1" style="text-align: left;">
							<c:forEach items="${tag}" var="tag" end="3">
								<li><a
									href="http://localhost:8080/search/result?type=Tag&keyword=<c:out value="${tag.tagName}" />&pageNum=1">
										#<c:out value="${tag.tagName}" />
								</a></li>
							</c:forEach>
						</ul>
						<ul id="keywordDiv_2" style="display: none; text-align: left;">
							<c:forEach items="${tag}" var="tag" begin="4" end="7">
								<li><a
									href="http://localhost:8080/search/result?type=Tag&keyword=<c:out value="${tag.tagName}" />&pageNum=1">
										#<c:out value="${tag.tagName}" />
								</a></li>
							</c:forEach>
						</ul>
						<ul id="keywordDiv_3" style="display: none; text-align: left;">
							<c:forEach items="${tag}" var="tag" begin="8" end="11">
								<li><a
									href="http://localhost:8080/search/result?type=Tag&keyword=<c:out value="${tag.tagName}" />&pageNum=1">
										#<c:out value="${tag.tagName}" />
								</a></li>
							</c:forEach>
						</ul>
					</div>                     
                   <div class="keyword_btn">
						<a href="#" class="tagBtnNext"><img
							src="https://recipe1.ezmember.co.kr/img/btn_arrow2_r.gif"
							alt="다음"></a>
					</div>
                </div>
            </div>
            </div>
           <div class="header_innerRight" data-group="mid">
				<ul>
					<li><a href="#"> <img
							src="https://png.pngtree.com/element_our/png_detail/20181206/folder-vector-icon-png_260858.jpg"
							style="width: 60px; height: 60px;" alt="찜목록">
					</a></li>
					<li><a href="/upload/registration"> <img
							src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT-LsVgb7CPM0yQoJXVff8SXjXhR_EVNNWylg&usqp=CAU"
							style="width: 60px; height: 60px;" alt="레시피등록"></a></li>
				</ul>
			</div>
        </div>

        <div class="header_innerBottom" data-group="main">
            <ul class="navBottom">
                <li><a href="/index" id="nav">홈</a></li>
                <li><a href="/recipe/list?categoryNo=11" id="nav">주식</a></li>
                <li><a href="/recipe/list?categoryNo=22" id="nav">디저트</a></li>
                <li><a href="/recipe/list?categoryNo=33" id="nav">반찬</a></li>
                <!--                 
                <li><a href="/user/hotkitchen" id="nav">인기주방장</a></li>
                 -->
                <li><a href="/user/mkitchen" id="nav">내 주방</a></li>
            </ul>
        </div>
            </div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
     console.log('<c:out value="${userNo}"/>');
     
     var result = '<c:out value="${result}"/>';
     
     history.replaceState({},null,null);
     
     let tagTable = document.querySelectorAll("[data-value]");
		var cnt = 1;
		$(".tagBtnNext").on("click", function(e) {
			cnt++;
			switch (cnt) {
			case 2:
				$("#keywordDiv_1").hide();
				$("#keywordDiv_2").show();
				break;
			case 3:
				$("#keywordDiv_2").hide();
				$("#keywordDiv_3").show();
				break;
			case 4:
				$("#keywordDiv_3").hide();
				$("#keywordDiv_1").show();
				cnt = 1;
				break;
			}

		});
     
     var searchForm = $("#searchForm");
     $("#searchForm button").on("click", function(e){
        if(!searchForm.find("option:selected").val()){
           alert("검색종류를 선택하세요.");
           return false;
        }
        
        if(!searchForm.find("input[name='keyword']").val())
        {
           alert("키워드를 입력하세요.");
           return false;
        }
        
        searchForm.find("input[name='pageNum']").val("1");
        e.preventDefault();
        searchForm.submit();
     });
  });
  </script>