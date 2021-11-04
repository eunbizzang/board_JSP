<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign up Page</title>
    <script type="text/javascript">
    
        // 회원가입 화면의 입력값들을 검사한다.
        function checkValue()
        {
            let form = document.userInfo;
            
            if(form.idDuplication.value != "idCheck"){
                alert("아이디 중복체크를 해주세요.");
                return false;
            }
            
            // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
            if(form.password.value != form.passwordcheck.value ){
                alert("Please check your password");
                return false;
            }    
           
            if(isNaN(form.phone.value)){
                alert("input your phonenumber without -.");
                return false;
            }
        }
        
        // 취소 버튼 클릭시 첫화면으로 이동
        function goFirstForm() {
            location.href="Main.jsp";
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
</head>
<body>
	<div align="center">
        <br><br>
        <b><font size="6" color="gray">Create Account</font></b>
        <br><br><br>
        
        <form  method="post" action="<%=request.getContextPath() %>/board_signup_ok.do"  onsubmit="return checkValue()">
            <table>
                <tr>
                    <td>ID</td>
                    <td>
                        <input type="text" name="id" maxlength="20" required onkeydown="inputIdChk()">
                        <input type="button" value="중복확인"  onclick="openIdChk()">    
                        <input type="hidden" name="idDuplication" value="idUncheck" >  
                    </td>
                </tr>
                        
                <tr>
                    <td>PASSWORD</td>
                    
                    <td>
                        <input type="password" name="password" placeholder="Enter password" 
                        maxlength="15" required>
                    </td>
                </tr>
                
                <tr>
                    <td>CONFIRM PASSWORD</td>
                    <td>
                        <input type="password" name="password_check" 
                        placeholder="Confirm password" maxlength="15" required>
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
                    
                <tr>
                    <td>EMAIL</td>
                    <td>
                        <input type="text" name="email_1" maxlength="30" required>@
                        <select name="email_2">
                            <option>naver.com</option>
                            <option>daum.net</option>
                            <option>gmail.com</option>
                            <option>nate.com</option>                        
                        </select>
                    </td>
                </tr>
                    
                <tr>
                    <td>PHONE</td>
                    <td>
                        <input type="text" name="phone" required>
                    </td>
                </tr>
                <tr>
                    <td>ADDRESS</td>
                    <td>
                        <input type="text" size="50" name="address" required>
                    </td>
                </tr>
            </table>
            <br>
            <div><input type="checkbox" name="accept" id="accept">
                <p>I accept the <a href="#">Terms&Conditions</a></p>
            </div>
            <input type="submit" value="가입">  <input type="button" value="취소" onclick="goFirstForm()">
        </form>
    </div>
</body>
</html>