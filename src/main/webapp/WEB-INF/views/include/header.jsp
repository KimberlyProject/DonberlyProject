<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt"  %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap-theme.min.css" integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${path}/resources/css/common.css">
<script>
	function action_path(){
	    const prevpath = location.pathname
	    const new_prevpath = prevpath.substr(0, prevpath.length-1); // /path/ 뒤에 / 빼기
	    
	    if("${path}" === new_prevpath){ // path에 경로 안붙었을때; 
	       location.href = "${path}/member/login?action=/";	       
	       return false;
	    }else if("${path}"){ // path 값있을때
	       	const firstpath = prevpath.substring(0,prevpath.indexOf("/", 1)); // 첫번째 디덱토리
		    location.href = "${path}/member/login?action=" + prevpath.substr(firstpath.length, prevpath.length-1);
	       return false;         
	    }
	    location.href = "${path}/member/login?action=" + prevpath;
	    return false;
	 }
 </script>