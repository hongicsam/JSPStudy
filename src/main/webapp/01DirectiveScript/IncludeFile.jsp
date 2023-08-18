<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
HTML 주석 (소스보기 했을떄 화면에 출력된다.)
보통의 경우 인클루드 되는 JSP파일은 HTML태그없이 순수한 JSP코드만 작성하는 것이 좋다.
포함되었을때 HTML 태그가 중복될 수 있기 때문이다.
 -->
 <%-- 
 JSP 주석 (소스보기 하더라도 출력되지 않는다.)
 포함되는 페이지를 만들떄에도 page 지시에는 반드시 있어야 한다.
 page 지시어가 없는 JSP파일은 500d에러가 발핸된다.
  --%>
<%
LocalDate today = LocalDate.now(); //오늘 날짜
LocalDateTime tomorrow = LocalDateTime.now().plusDays(1); //내일 날짜
%>