<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign up Page</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(function() {
		
		$(function() {
			$("#idcheck").hide();	// hides span tag
			
			let userId = $("#id").val();
			
			// check input size
			if($.trim($.("#id").val()).length < 4) {
				let warningTxt =
				'<font color="red">Have at least 4 letters</font>';
				$("#idcheck").text(''); // reset idcheck
				$("#idcheck").show(); 	// show span tag.
				$("#idcheck").append(warningTxt);
				$("#id").val("").focus;
				return false;
			}
			if($.trim($.("#id").val()).length > 16) {
				let warningTxt =
				'<font color="red">Have at less than 16 letters</font>';
				$("#idcheck").text(''); // reset idcheck
				$("#idcheck").show(); 	// show span tag.
				$("#idcheck").append(warningTxt);
				$("#id").val("").focus;
				return false;
			}
		});
	});
</script>
</head>
<body>
	<div align="center">
        <br><br>
        <b><font size="6" color="gray">Create Account</font></b>
        <br><br><br>
        
        <form  method="post" action="<%=request.getContextPath() %>/board_signup_ok.do">
            <table>
                <tr>
                    <td>ID</td>
                    <td>
                        <input type="text" name="id" maxlength="20" required>
                        <input type="button" value="중복확인"  id="idcheck_btn">    
                        <span id="idcheck"></span>
                        <input type="hidden" name="idDuplication" value="idUncheck" >  
                    </td>
                </tr>
                        
                <tr>
                    <td>PASSWORD</td>
                    
                    <td>
                        <input type="password" name="password" id="pw"
                        placeholder="Enter password" 
                        maxlength="15" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" 
                         title="Must contain at least one  number and one uppercase and lowercase letter, 
                         and at least 8 or more characters" required>
                    </td>
                </tr>
                
                <tr>
                    <td>CONFIRM PASSWORD</td>
                    <td>
                        <input type="password" name="password_check" id="pwc"
                        placeholder="Confirm password" maxlength="15" required>
                        <div id="message">**Passwords must be same</div>
                    </td>
                </tr>
                    
                <tr>
                    <td>NAME</td>
                    <td>
                        <input type="text" name="name" maxlength="40" required>
                    </td>
                </tr>
                <tr>
                    <td>BIRTHDAY</td>
                    <td><input type="date" name="birthday" required>
                    </td>
                </tr>
                <!-- tr>
                    <td>EMAIL</td>
                    <td>
                        <input type="text" name="email1" id="email01"> @ 
                        <input type="text" name="email2" id="email02" disabled value="naver.com"> 
                        <select name="selectEmail" id="selectEmail"> 
                        	<option value="1">other</option> 
                        	<option value="naver.com" selected>naver.com</option> 
                        	<option value="yahoo.co.kr">yahoo.co.kr</option> 
                        	<option value="gmail.com">gmail.com</option>
                        </select> 
                        <script type="text/javascript"> //이메일 입력방식 선택 $('#selectEmail').change(function(){ $("#selectEmail option:selected").each(function () { if($(this).val()== '1'){ //직접입력일 경우 $("#str_email02").val(''); //값 초기화 $("#str_email02").attr("disabled",false); //활성화 }else{ //직접입력이 아닐경우 $("#str_email02").val($(this).text()); //선택값 입력 $("#str_email02").attr("disabled",true); //비활성화 } }); }); </script>
                    </td>
                </tr> -->
                <tr>
                    <td>PHONE</td>
                    <td>
                        <input type="text" name="phone" pattern="\d*" title="Must input only number" required>
                    </td>
                </tr>
                <tr>
                    <td>ADDRESS</td>
                    <td>
                        <input type="text" size="50" name="address" required>
                    </td>
                </tr>
            </table>
            <div><input type="checkbox" name="accept" id="accept" required>
                <p>I accept the <a href="#">Terms&Conditions</a></p>
            </div>
            <input type="submit" value="가입">  <input type="button" value="취소" onclick="goFirstForm()">
        </form>
    </div>
    
    <script>
 	// 취소 버튼 클릭시 첫화면으로 이동
    function goFirstForm() {
        location.href="main.jsp";
    }    
   
    // 아이디 중복체크 화면open
    function openIdChk(){
            
        window.name = "parentForm";
        window.open("member/IdCheckForm.jsp",
                "chkForm", "width=500, height=300, resizable = no, scrollbars = no");    
    }
     
    // 아이디 입력창에 값 입력시 hidden에 idUncheck를 세팅한다.
    // 이렇게 하는 이유는 중복체크 후 다시 아이디 창이 새로운 아이디를 입력했을 때
    // 다시 중복체크를 하도록 한다.
    function inputIdChk(){
        document.userInfo.idDuplication.value ="idUncheck";
    }
    </script>
</body>
</html>