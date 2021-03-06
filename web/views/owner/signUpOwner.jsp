<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>

        <!-- 회원정보 수정 form -->
        <br><br><br><br>
        
        <section id="enroll-container">

             <center><p class="title" style="color: #6a60a9;">업체회원가입</p></center>
   <br><br>
            <br>
            <hr>
            <br>

            <form name="form1" method="post" action="<%=request.getContextPath()%>/owner/signUp"
            onsubmit="return signUp_validate();">
                <table class="updateTable">
                    <colgroup>
                        <col width="160px">
                        <col width="">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th class="point" style="vertical-align: middle"><strong class="point"></strong>아이디
                            </th>
                            <td>
                            <input type="text" name="oid" id="oid_" placeholder="영문+숫자로 4글자 이상">
                            <input type="button" name="idDuplication" value="중복검사" onclick="checkId();">
                            </td>
                        </tr>
                        <tr>
                            <th class="point"><strong class="point"></strong>비밀번호</th>
                            <td><input type="password" name="opass" id="opass" placeholder="6~20자로 사용(영문/숫자)"></td>
                        </tr>
                        
                        <tr>
                            <th class="point"><strong class="point"></strong>비밀번호확인</th>
                            <td><input type="password" id="opass2" placeholder="6~20자로 사용(영문/숫자)"></td>
                        </tr>
                        <tr>
                            <th class="point"><strong class="point"></strong>이름</th>
                            <td><input type="text" name="oname" id=oname></td>
                        </tr>
                        <tr>
                            <th class="point"><strong class="point"></strong>생년월일</th>
                            <td>
                            <input check-join-date input-number type="number" name="obirthYY" id="obirthYY" class="" min="1900" max="2005" maxlength="4">년                            
                            <input check-join-date input-number type="number" name="obirthMM" id="obirthMM" class="" min="1" max="12" maxlength="2" >월                            
                            <input check-join-date input-number type="number" name="obirthDD" id="obirthDD" class="" min="1" max="31" maxlength="2"  >일                           
                            </td>
                        </tr>
                        <tr>
                            <th class="point"><strong class="point"></strong>성별</th>
                            <td>
                                <input type="radio" name="ogender" id="ogender0" value="M">남
                                &nbsp;
                                <input type="radio" name="ogender" id="ogender1" value="F">여
                            </td>
                        </tr>
                        
                        <tr>
                            <th class="point"><strong class="point"></strong>이메일</th>
                            <td>
                            	<input type="hidden" name="confirmYN" id="confirmYN" value="N" >
                            	<input type="email" name="oemail" id="oemail" placeholder="' @ '포함 입력하시오" >
                            	<input type="button" id="emailConfirm" value="인증번호발송">
                            </td>
                        </tr>

                        <tr>
                            <th class="point"><strong class="point"></strong>핸드폰번호</th>
                            <td><input type="tel" name="ophone" id=ophone placeholder="' - '빼고 입력하시오" maxlength="11"></td>
                        </tr>
                        
						<tr>
						<th class="point">주소</th>
						<td>
						<input type="text" id="zonecode" name="zonecode" type="text" value="" style="width:50px;" readonly/>
	&nbsp;
						<input type="button" onClick="openDaumZipAddress();" value = "주소 찾기" />
						<br/>
						<input type="text" id="address" name="address" value="" style="width:240px;" readonly/>
						<input type="text" id="address_etc" name="address_etc" placeholder="상세주소 입력"  value="" style="width:200px;"/>
						
						</td>
						
						</tr>
<!--                         <tr> -->
<!--                             <th class="point">주소</th> -->
<!--                             <td><input type="text" class="form-control" name="caddr" id="caddr" placeholder="주소" required><br></td> -->
<!--                         </tr> -->
                    </tbody>
                    
                </table>
            	<div class="button">
				<br><br>
                <input type="submit" value="회원가입">
              

            </div>
            </form>
            <form name="checkIdDuplicateFrm" method="post">
			<input type="hidden" name="userId" />
			</form>
           <br>
            <hr>
        </section>
        
      
    <script type="text/JavaScript" src="http://code.jquery.com/jquery-1.7.min.js"></script>
	<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>    
	<script>
	
	$(function(){
	      $('#emailConfirm').click(function(){
	         console.log("인증버튼클릭!!");
	         var dataString=$('#oemail').val();
	         $.ajax({
	            url:"<%=request.getContextPath()%>/member/emailConfirm",
	            type:"post",
	            data:{dataString:dataString},
	            dataType:"html",
	            success:function(data){
	               console.log(data);
	               var br=$('<br/>');
	               var span=$('<span>');
	               var input=$('<input>').attr({
	                  "type":"text","name":"confirmCode","id":"confirmCode"
	               });
	               var btn=$('<input>').attr({
	                  "type":"button","name":"confirmBtn",
	                  "value":"인증번호확인","id":"confirmBtn"
	               });
	               
	               setTimeout(function(){
	                  console.log("함수실행")
	                  $('#confirmBtn').parent().html("시간초과, 발송버튼을 다시 눌러 인증하세요.").css({"color":"red"});
	               }, 180000);
	               
	               span.append(input).append(btn);
	               $('#oemail').parent().append(br).append(span);
	               
	               $('#confirmBtn').click(function(){
	                  var code=$('#confirmCode').val().trim();
	                  if(code==data){
	                     $(this).parent().html("인증완료").css("color","blue");
	                     $('#confirmYN').attr("value","Y");
	                  }else{
	                     alert('인증번호 불일치 : [인증번호를 다시 확인하세요.]');
	                  }
	               }) 
	            },
	            error:function(data){
	            }
	         });
	         $(this).attr({"disabled":"true"});
	      });
	   });
	   // 1. email 인증 버튼 클릭 -> 아래에 인증번호 입력칸과 확인버튼, 타이머 활성화
	   // 2. 입력된 email로 인증번호를 발송 (인증번호는 random값 4자리)
	   // 3. interval 등을 사용해서 타이머 제한 (인증번호 유효시간 3:00)
	   // 4. 유효시간 안에 일치하는 인증번호 입력 후, 확인버튼 클릭 -> 칸,버튼,타이머가 인증완료 텍스트로 변환
	   // 5. 인증완료 된 상태에서만 회원가입 가능하게 처리.
	
	$(function(){
        $('#opass2').blur(function(){
            var pw=$('#opass').val();
            var pw2=$(this).val();
            if(pw!=pw2){
                alert("패스워드가 일치하지 않습니다.");
                $(this).val("");
                $('#opass').val("").focus();
            }
        })
    });
	
	
	//회원가입 유효성검사
	function signUp_validate() {
		
        var userId=$("#oid_");
        
        //아이디 유효성 소문자+숫자
        var regExpId = /^[a-z0-9]{4,12}$/;
		if(!regExpId.test(form1.oid_.value)) {
			alert("아이디는 소문자,숫자 4글자 이상,15자이하로 가능합니다");
			return false;
		}
		
// 		//중복확인 체크 유효성검사
// 		if(form1.idDuplication.value != "checkId") {
// 			alert("아이디 중복체크를 해주세요");
// 			return false;
// 		}
          
        //비밀번호 빈칸
        if (form1.opass.value=="" || form1.opass2.value=="") {
            alert("비밀번호를 입력하지 않았습니다.")
            opass2.focus()
            return false;
        }
        
        //비밀번호길이 6,20
        if(form1.opass.value.length<6 || form1.opass.value.length>20) {
       		alert("비밀번호를 6자이상,20자이하로 입력해주세요")
       		opass.focus();
       		return false;
       	}

       	// 아이디 != 비밀번호
        if (form1.opass.value == form1.oid_.value) {
            alert("아이디와 비밀번호가 같습니다.")
            opass.focus()
            return false;
        }
       	
      	//이름 유효성
      	var namePattern = /^[가-힣]{2,10}$/;
        if(!namePattern.test(form1.oname.value)){
			alert("이름은 한글만 입력이 가능합니다..");
			oname.focus();
			return false;
		}
       	
        //이름 빈칸
        if(form1.oname.value==""){
			alert("이름을 입력해 주십시오.");
			oname.focus();
			return false;
		}
        
      	//생년월일 빈칸
        if(form1.obirthYY.value=="" ||form1.obirthMM.value=="" ||form1.obirthDD.value==""){
			alert("생년월일을 입력해 주십시오.");
			obirthYY.focus();
			return false;
		}
       	//성별 빈칸
      	if(!form1.ogender0.checked && !form1.ogender1.checked) {
      		alert("성별을 선택해 주십시오.");
			form1.ogender0.focus();
			return false;
      	}
        
        //이메일 빈칸
        if(form1.oemail.value==""){
			alert("이메일을 입력해 주십시오.");
			oemail.focus();
			return false;
		}
      	//핸드폰 빈칸
        if(form1.ophone.value==""){
			alert("핸드폰번호를 입력해 주십시오.");
			ophone.focus();
			return false;
		}
		//주소 빈칸
        if(form1.postcode1.value=="" || form1.postcode2.value==""){
			alert("우편번호를 입력해주세요.");
			postcode1.focus();
			return false;
		}
		
        if(form1.address.value=="" || form1.address_etc.value==""){
			alert("상세주소를 입력해주세요.");
			address_etc.focus();
			return false;
		}
      	
        
        return true;
    }
	

	function checkId() {
		var userId=$("#oid_").val().trim();
		if(!userId || userId.length<4) {
			alert("아이디를 4글자 이상가능합니다.");
			return;
		}
		
		var regExpId = /^[a-z0-9]{4,12}$/;
		if(!regExpId.test(form1.oid_.value)) {
			alert("아이디는 소문자,숫자 4글자 이상,15자이하로 가능합니다");
			return false;
		}
	
	
	var url = "<%=request.getContextPath()%>/checkIdOwner";
	var title = "checkId";
	var status = "left=500px,top100px width=500px, height=300px,menubar=no,status=no,scrollbars=yes";
	var popup = open("",title,status);
	checkIdDuplicateFrm.userId.value=userId;
	checkIdDuplicateFrm.target=title;
	checkIdDuplicateFrm.action=url;
	checkIdDuplicateFrm.submit();
	
	}
	
	//다음 주소 API
	function openDaumZipAddress() {

	new daum.Postcode({

		oncomplete:function(data) {

			jQuery("#postcode1").val(data.postcode1);

			jQuery("#postcode2").val(data.postcode2);

			jQuery("#zonecode").val(data.zonecode);

			jQuery("#address").val(data.address);

			jQuery("#address_etc").focus();

			console.log(data);

		}

	}).open();

}
	
	
	</script>
<%@ include file="/views/common/footer.jsp" %>









