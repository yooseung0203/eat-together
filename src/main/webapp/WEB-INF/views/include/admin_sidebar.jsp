<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- admine용 css  -->
<link rel="stylesheet" type="text/css" href="/resources/css/admin.css">
<!-- ******************* -->
<div class="container-fluid mx-0 sidebar admin_menubar_text">
           <div class="row logo">
                <div class="col">
                    <img src="/resources/img/admin-logo.png">
                </div>
            </div> 
            <div class="row menubtn">
                <div class="col">
                    <a href="/admin/toAdmin">Home</a>
                </div>
            </div> 
            <div class="row menubtn">
                <div class="col">
                    <a href="/admin/toAdmin_member">회원관리</a>
                </div>
            </div> 
            <div class="row menubtn">
                <div class="col">
                    <a href="/admin/toAdmin_party">모임글관리</a>
                </div>
            </div> 
            <div class="row menubtn">
                <div class="col">
                    <a href="/admin/sortReview?option=write_date">리뷰관리</a>
                </div>
            </div>
            <div class="row menubtn">
                <div class="col">
                    <a href="">신고관리</a>
                </div>
            </div>
            <div class="row menubtn">
                <div class="col">
                    <a href="/question/AdminQuestion_list">1:1문의</a>
                </div>
            </div> 
            <div class="row menubtn">
                <div class="col">
                    <a href="/admin/toAdmin_faq">FAQ관리</a>
                </div>
            </div> 
            <div class="row menubtn">
            	<div class="col">
            		<a href="" onclick="window.close();">관리자메뉴 닫기</a>
            	</div>
            </div>
        </div>