<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.jb.pension.model.vo.Pension" %>
<%
	List<Pension> pensions = (List)request.getAttribute("pensions");
	int cPage = (int)request.getAttribute("cPage");
	String searchType = (String)request.getAttribute("searchType");
	String searchKey = (String)request.getAttribute("searchKeyword");
%>

<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/master/commonNav.jsp"%>
            <!--content영역-->
            <div class="col-md-10">
                <br><br><br>
                <h2 style="text-align:center">펜션관리</h2> <br>
                
                <div class="pull-left">
                	검색타입 : 
                	<select id="searchType" style="width:90px;height:25px;">
                		<option value="pensionName" <%="p_name".equals(searchType)?"selected":"" %>>펜션이름</option>
                		<option value="ownerId" <%="o_id".equals(searchType)?"selected":"" %> >업주 아이디</option>
                	</select>
                	<div id="search-pensionName">
                		<form action="<%=request.getContextPath()%>/master/pensionSearch">
                			<input type="hidden" name="searchType" value="p_name"/>
                			<input type="hidden" name="cPage" value="<%=cPage %>"/>
                			<input type="text" placeholder="펜션이름으로 검색" name="searchKeyword"
                				value='<%="p_name".equals(searchType)?searchKey:"" %>' style="width:150px;height:25px"/>
                			<button type="submit">검색</button>
                		</form>
                	</div>
                	<div id="search-ownerId">
                		<form action="<%=request.getContextPath()%>/master/pensionSearch">
                			<input type="hidden" name="searchType" value="o_id"/>
                			<input type="hidden" name="cPage" value="<%=cPage %>"/>
                			<input type="text" placeholder="업주 아이디 검색" name="searchKeyword"
                				value='<%="o_id".equals(searchType)?searchKey:"" %>' style="width:150px;height:25px"/>
                			<button type="submit">검색</button>
                		</form>
                	</div>
                </div>
                <button id="deleteBtn" class="pull-right">삭제</button>
                <br><br><br>
                
                                
                <table id="tbl-pensionList" class="table table-hover">
                    <thead>
                        <tr>
                        	<th style="text-align:left"><input type="checkbox" name="selected_all"></th>
                            <th style="text-align:center">펜션코드</th>
                            <th style="text-align:center">펜션이름</th>
                            <th style="text-align:center">소재지</th>
                            <th style="text-align:center">전화번호</th>
                            <th style="text-align:center">펜션업주 아이디</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<% if(pensions!=null && !pensions.isEmpty()) {
	                    	 for(Pension p : pensions) { %>
		                        <tr>
		                        	<td style="text-align:left"><input type="checkbox" name="selected" value="ROW"></td>
		                            <td><%=p.getpCode() %></td>
		                            <td style="cursor:pointer">
		                            	<a href="<%=request.getContextPath()%>/master/roomList?pensionName=<%=p.getpName()%>">
		                            		<%=p.getpName() %>
		                            	</a>
		                            </td>
		                            <td><%=p.getpAddr() %></td>
		                            <td><%=p.getpTel() %></td>
		                            <td><%=p.getoId() %></td>
		                        </tr>
		                <%	}
	                    }%>
                    </tbody>
                </table>
                
                <div class="text-center">
                  <ul class="pagination">
                     <li><%=request.getAttribute("pageBar") %></li>
                  </ul>
               </div>
               
               <script>
		        	$(function(){
		        		var p_name = $("#search-pensionName");
		        		var o_id = $("#search-ownerId");
		        		var searchType = $("#searchType");
		        		searchType.change(function(){
		        			p_name.hide();
		        			o_id.hide();
		        			$("#search-"+this.value).css("display","inline-block");
		        		});
		        		$("#searchType").trigger('change');
		        	});

		        	//전체 선택 및 해제
		        	$('input[name=selected_all]').on('change', function(){
		        		$('input[name=selected]').prop('checked', this.checked);
		        	});
		        	
		        	//삭제버튼 동작
		        	$("#deleteBtn").click(function(){
		        		if(confirm("정말로 삭제하시겠습니까?")){
							var tdArr = new Array();
							var checkbox = $("input[name=selected]:checked");
							
							// 체크된 체크박스 값을 가져온다
							checkbox.each(function(i) {
								// checkbox.parent() : checkbox의 부모는 <td>이다.
								// checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
								var tr = checkbox.parent().parent().eq(i);
								var td = tr.children();
								
								// td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
								var clientId = td.eq(1).text();
								
								// 가져온 값을 배열에 담는다.
								tdArr.push(clientId);
							});
							console.log(tdArr);
		        		}
					});
		        	
		        </script>
		        
            </div>
            
<%@ include file="/views/common/footer.jsp"%>