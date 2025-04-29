// 버튼 2개 요소 가져와서 변수에 저장 후 요소 확인
//let btn1 = document.getElementById("btnChangeImg1");
//let btn2 = document.getElementById("btnChangeImg2");
//console.log(btn1);
//console.log(btn2);
// => 대상 요소들이 로딩되기 전이므로 요소 접근 시 null 리턴됨
// => 결론! 자바스크립트 내에서 요소 로딩 후에 대상에 접근하기 위해 window.onload 활용해야한다!
// ----------------------------------------------------------------------------------
// window 객체의 onload 이벤트 핸들링
window.onload = function() {
	// 버튼 2개 요소 가져와서 변수에 저장 후 요소 확인
	let btn1 = document.getElementById("btnChangeImg1");
	let btn2 = document.getElementById("btnChangeImg2");
//	console.log(btn1);
//	console.log(btn2);
	// -------------------------------------------------
	// 이미지 요소 객체 가져와서 변수에 저장
	let img1 = document.getElementById("img1");
	// -------------------------------------------------
	// 이미지교체 버튼 클릭 시 이미지 파일 교체하기
	// 1) 해당 태그의 onlick 속성을 통해 클릭 이벤트 발생 시 실행할 함수 호출(또는 코드 기술)
	// <input type="button" value="이미지교체1" id="btnChangeImg1" onclick="changeImage1()">
	
	// 2) 자바스크립트 코드에서 해당 버튼 요소 객체의 onclick 속성을 활용하여 클릭 이벤트 핸들링
	// 2-1) onclick 속성에 별도로 정의한 함수를 전달하는 방법
	//      => 주의! 함수명 뒤에 소괄호() 를 제외하고 함수명만 지정하여 함수를 전달해야한다!
//	btn1.onclick = changeImage1; // btn1 요소 클릭 시 changeImage1 함수가 자동으로 호출됨
//	btn2.onclick = changeImage2; // btn2 요소 클릭 시 changeImage2 함수가 자동으로 호출됨
	
	// 2-2) 별도의 함수를 정의하지 않고 익명함수 형태로 전달하는 방법
	//      => heart(empty).png, heart(full).png 로 교체
	btn1.onclick = function(e) {
		// 익명함수 파라미터(event) 지정 시 이벤트 객체가 자동으로 전달됨(변수명은 무관함)
		console.log(e); // 이벤트 객체가 출력됨
		
		// 익명함수 내에서 this 사용 시 해당 이벤트 발생 객체가 this 에 저장됨
		// => 현재 익명함수를 호출한 주체가 btn1 객체이므로 this 에는 btn1 객체가 저장되어 있음
		console.log(this);
		console.log(btn1);
		// => 위의 두 객체는 동일하다!
		
		// 이미지 교체하기
		img1.src = "../images/heart(empty).png";
	}
	
//	btn2.onclick = function() {
//		img1.src = "../images/heart(full).png";
//	}

	btn2.onclick = () => {
		img1.src = "../images/heart(full).png";
	}
	
	
} // window.onload 익명함수 끝

function changeImage1() {
	document.getElementById("img1").src = "../images/2.jpg";
}

function changeImage2() {
	document.getElementById("img1").src = "../images/3.jpg";
}





















