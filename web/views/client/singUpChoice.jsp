<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

 <section>
            <br><br><br><br>
            <div class="jumbotron">
                <div class="container border">
                    <div class="row">
                        <div class="col-sm-6 col-md-4 col-md-offset-4">
                            <div class="account-wall">
    
                                     <center><p class="title" style="color: #6a60a9;">선택하세요</p></center>
                               
                                <form class="form-signin">
                                   <br><br>
                                    <input type="button" class="btn btn-lg btn-warning btn-block" value="일반회원가입"
                                    onclick="location.href='<%=request.getContextPath()%>/signUpTermsClient'" 
                                    ><br>
                                    <br>
                                    <input type="button" class="btn btn-lg btn-warning btn-block" value="업체회원가입"
                                    onclick="location.href='<%=request.getContextPath()%>/singUpTermsOwner'" 
                                    ><br>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
          </div>
        </section>
    

        <br><br><br><br><br><br><br>

<%@ include file="/views/common/footer.jsp" %>









