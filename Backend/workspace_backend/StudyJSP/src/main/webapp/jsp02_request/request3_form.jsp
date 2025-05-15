<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="final_exam.js"></script>
<!-- 다음 우편번호 API 자바스크립트 라이브러리 추가(외부 라이브러리 - 인터넷 연결 필수) -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<div align="center">
		<h1>회원가입</h1>
		<form action="request3_pro.jsp" name="joinForm" method="post">
			<table border="1">
				<tr>
					<th>이름</th>
					<td><input type="text" name="name"></td>
					<td rowspan="4" align="center">
						<img src="../images/heart(empty).png" id="profileImg" width="50" height="50"><br>
						<input type="button" value="이미지변경" id="btnChangeImg">
					</td>
				</tr>
				<tr>
					<th>ID</th>
					<td>
<!-- 						<input type="text" name="id" placeholder="4 ~ 8글자 사이 입력"> -->
						<!-- ID중복확인 버튼으로 모든 체크를 수행하기 위해 읽기전용 설정 -->
						<input type="text" name="id">
						<input type="button" value="ID중복확인" id="btnChecKId">
						<div id="checkIdResult"></div>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="passwd" placeholder="8 ~ 16글자 사이 입력">
						<div id="checkPasswdResult"></div>
					</td>
				</tr>
				<tr>
					<th>비밀번호확인</th>
					<td>
						<input type="password" id="passwd2">
						<div id="checkPasswd2Result"></div>
					</td>
				</tr>
				<tr>
					<th>주민번호</th>
					<td colspan="2">
						<!-- 텍스트박스에 size 속성으로 텍스트박스 길이 조정 가능 -->
						<!-- maxlength 속성 지정 시 실제 입력되는 텍스트 갯수(길이) 제한 가능 -->
						<input type="text" name="jumin1" size="10" maxlength="6"> -
						<input type="text" name="jumin2" size="10" maxlength="7">
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td colspan="2">
						<input type="text" name="postcode" placeholder="우편번호" size="6">
						<input type="button" value="주소검색" id="searchAddress"><br>
						<input type="text" name="address1" placeholder="기본주소" size="20">
						<input type="text" name="address2" placeholder="상세주소" size="20">
					</td>
				</tr>
				<tr>
					<th>E-Mail</th>
					<td colspan="2">
						<input type="text" name="email1" size="10">@<input type="text" name="email2" size="10">
						<select id="emailDomain">
							<option value="">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="nate.com">nate.com</option>
							<option value="gmail.com">gmail.com</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>직업</th>
					<td colspan="2">
						<select name="job">
							<option value="">항목을 선택하세요</option>
							<option value="개발자">개발자</option>
							<option value="DB엔지니어">DB엔지니어</option>
							<option value="관리자">관리자</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>성별</th>
					<td colspan="2">
						<input type="radio" name="gender" value="M" id="gender_male"><label for="gender_male">남</label>
						<input type="radio" name="gender" value="F" id="gender_female"><label for="gender_female">여</label>
					</td>
				</tr>
				<tr>
					<th>취미</th>
					<td colspan="2">
						<input type="checkbox" id="hobby1" name="hobby" value="여행"><label for="hobby1">여행</label>
						<input type="checkbox" id="hobby2" name="hobby" value="독서"><label for="hobby2">독서</label>
						<input type="checkbox" id="hobby3" name="hobby" value="게임"><label for="hobby3">게임</label>
						<input type="checkbox" id="check_all"><label for="check_all">전체선택</label>
					</td>
				</tr>
				<tr>
					<th>가입동기</th>
					<td colspan="2">
						<textarea rows="5" cols="40" name="joinReason"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="3" align="center">
						<input type="submit" value="가입">
						<input type="reset" value="초기화">
						<!-- 11. 돌아가기 버튼 클릭 시 이벤트 처리를 통해 이전 페이지로 이동 처리 -->
						<input type="button" value="돌아가기" onclick="history.back()">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
















