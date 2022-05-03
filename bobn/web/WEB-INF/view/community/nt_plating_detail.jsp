<%@page import="kh.semi.bobn.community.model.vo.NtPlatingRecommentVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kh.semi.bobn.community.model.vo.NtPlatingImgVo"%>
<%@page import="kh.semi.bobn.community.model.vo.NtPlatingContentVo"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/community/ntreset.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/community/ntcommon.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/community/nt_plating_detail.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>플레이팅_상세조회</title>
</head>
<body>
<!-- 받아온 db가 담겨있는 ntpcVolist를 화면에 뿌려줄 예정 -->
<%
NtPlatingContentVo ntpcVo = (NtPlatingContentVo)request.getAttribute("ntpcVo");
ArrayList<NtPlatingImgVo> ntpiVolist = (ArrayList<NtPlatingImgVo>)request.getAttribute("ntpiVolist");
ArrayList<NtPlatingRecommentVo> ntprVolist = (ArrayList<NtPlatingRecommentVo>)request.getAttribute("ntprVolist");
%>
 <div class="j_wrap content">
        <div id="j_content">
            <section>
                <article id="j_ntpd_article0">
                    <p>플레이팅_상세조회</p>
                </article>
                <article id="j_ntpd_article1">
                    <ul>
                        <li id="j_ntpd_member_id">
                            <%=ntpcVo.getMemberId() %>
                        </li>
                    </ul>
                </article>
                <article id="j_ntpd_article2">
                    <table>
        				<tr>
                            <td class="j_ntpd_article2_img">제목 : <%=ntpcVo.getPbTitle() %></td>
                        </tr>
                    <% for(NtPlatingImgVo vo : ntpiVolist) {%>
                        <tr>
                            <td class="j_ntpd_article2_img slides">
                                <img src=<%=vo.getPiFile() %> id="j_ntpd_detail_img">
                                <button class="j_ntpd_slides_l" onclick="plusDivs(-1)">&laquo;</button>
								<button class="j_ntpd_slides_r" onclick="plusDivs(1)">&raquo;</button>
                            </td>
                        </tr>
                    <%} %>
                        
                        <tr>
                            <td class="j_ntpd_article2_img">내용 : <%=ntpcVo.getPbContent() %></td>
                        </tr>
                        <tr>
                            <td class="j_ntpd_article2_img">
                                <ul>
                                    <li id="j_ntpd_ntprCnt">
                                        <img src="https://via.placeholder.com/15" alt=""> ntprCnt
                                    </li>
                                </ul>
                            </td>
                            
                        </tr>
                        <tr>
                            <td class="j_ntpd_article2_img">
                                <form action="ntprwrite" method="post">
                                    <input type="hidden" name="pbNo" value="<%=ntpcVo.getPbNo() %>">
                                    <input type="text" name="prContent" id="j_ntpd_recomment">
                                    <button type="submit" id="j_ntpd_submit_btn">댓글등록</button>
                                </form>
                            </td>
                        </tr>
                    </table>
                </article>
                <article id="j_ntpd_article3">
                    <% for(NtPlatingRecommentVo vo : ntprVolist) {%>
                    <table>
                        <tr id="j_ntpd_memberid">
                            <td><%=vo.getMemberId() %></td>
                        </tr>
                        <tr id="j_ntpd_date">
                            <td><%=vo.getPrDate() %></td>
                        </tr>
                        <tr>
                            <td><%=vo.getPrContent() %></td>
                        </tr>
                    </table>
                        <hr>
                       <%} %>
                </article>
            </section>
        </div>
    </div>
    <script>
    var slideIndex = 1;
    showDivs(slideIndex);

    function plusDivs(n) {
      showDivs(slideIndex += n);
    }

    function showDivs(n) {
      var i;
      var x = document.getElementsByClassName("slides");
      if (n > x.length) {slideIndex = 1}
      if (n < 1) {slideIndex = x.length}
      for (i = 0; i < x.length; i++) {
         x[i].style.display = "none";  
      }
      x[slideIndex-1].style.display = "block";  
    }
    </script>
</body>
</html>