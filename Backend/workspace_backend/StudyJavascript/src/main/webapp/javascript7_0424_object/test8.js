/*
[ document 객체를 사용하여 특정 선택자를 갖는 요소(태그) 선택 방법 ]
< 2. document.querySelector() 또는 querySelectorAll() 메서드 활용 >
- querySelector() - 요소가 1개인 대상에 접근(주로 id 선택자)
                    단, 요소가 복수개인 대상(class 또는 태그 선택자)도 접근 가능하나 
					1개의 요소(첫번째 요소)만 리턴됨
- querySelectorAll() - 요소가 복수개인 대상에 접근(주로 class 또는 태그 선택자)
                       복수개의 요소가 NodeList 타입으로 리턴됨(배열처럼 사용)
- 두 메서드에 전달하는 파라미터(선택자)에 따라 전달하는 전달인자 형태가 달라짐
  1) id 선택자 : 선택자명 앞에 # 기호 붙임(ex. querySelector("#name"))
  2) class 선택자 : 선택자명 앞에 . 기호 붙임(ex. querySelectorAll(".names"))
  3) 태그 선택자 : 선택자명을 태그명으로 그대로 지정(ex. querySelectorAll("h1"))
- getElementXXX() 메서드는 지정할 대상을 명확하게 메서드명으로 나타내지만
  querySelector() 메서드(querySelectorAll())는 다양한 선택자를 하나의 메서드로 지정 가능
  => getElementXXX() 메서드가 성능이 더 우수함(= 빠름)
*/
function func1() {
	// id 선택자가 "name" 인 태그에 접근하여 해당 태그에 대한 객체 가져와서 텍스트값 출력하기
	// 1) document.getElementById() 메서드 사용
//	console.log(document.getElementById("name"));
//	console.log(`객체 타입 : ${document.getElementById("name")}`); // [object HTMLInputElement]
//	console.log(`입력받은 name 값 : ${document.getElementById("name").value}`);
	
	// 2) document.querySelector() 메서드 사용
	// => id 선택자를 지정하기 위해 "#id선택자명" 형태로 지정
//	console.log(document.querySelector("#name"));
//	console.log(`객체 타입 : ${document.querySelector("#name")}`); // [object HTMLInputElement]
//	console.log(`입력받은 name 값 : ${document.querySelector("#name").value}`);
	
	// 주의! querySelector() 메서드에 선택자 지정 기호가 포함되지 않으면
	// 단순 태그 선택자로 인식하고 해당 태그가 존재하지 않으면 객체가 리턴되지 않으므로(null)
	// 객체를 통해 요소에 접근하려 할 경우 오류 발생한다!
//	console.log(`입력받은 name 값 : ${document.querySelector("name").value}`);
	// => Cannot read properties of null (reading 'value')
	// --------------------------------------------------------------------------------------
	// id 선택자 "name" 요소에 접근하여 value 속성값을 "아이티윌" 로 변경
	document.querySelector("#name").value = "아이티윌";
	
	// id 선택자 "header1" 요소의 배경색 변경
	document.querySelector("#header1").style.backgroundColor = "LIME";
	
	// class 선택자 "header_class5" 요소에 접근하여 배경색을 YELLOW 로 변경
	// => id 선택자 기호(#) 대신 class 선택자 기호(.) 사용
	document.querySelector(".header_class5").style.backgroundColor = "YELLOW";
	// => 단, class 선택자가 복수개 존재하더라도 맨 처음 객체(요소)만 처리함
	//    즉, Header - 5_1 & Header - 5_2 중에서 첫번째 요소인 Header - 5_1 만 변경됨
	// ------------------------------------------------------------------------------
	// class 선택자가 동일한 복수개의 요소에 접근
	// 1) document.getElementsByClassName() 메서드 활용
	let header5Elements = document.getElementsByClassName("header_class5");
//	header5Elements.style.backgroundColor = "PINK";
	
	// 반복문으로 HTMLCollection 객체에 접근하여 배경색 차례대로 변경
	for(let element of header5Elements) {
		element.style.backgroundColor = "PINK";
	}
	
	// 2) document.querySelectorAll() 메서드 활용
	// => class 선택자를 위해 ".XXX" 형식으로 지정
	let header5Elements2 = document.querySelectorAll(".header_class5");
	console.log(header5Elements2); // NodeList 타입 객체(= 결국 배열) 출력됨
	
	// 반복문으로 NodeList 객체에 접근하여 배경색 차례대로 변경(기본 사용법은 HTMLCollection 과 동일)
	for(let element of header5Elements2) {
		element.style.backgroundColor = "LIME";
	}
	
	// -----------------------------------------------------
	// h4 태그 요소들의 텍스트 색상(style.color)과 텍스트 내용(innerText) 변경
	for(let element of document.querySelectorAll("h4")) { // 변수없이 직접 배열 지정 가능
		element.style.color = "BLUE";
		element.innerText = "변경된 텍스트";
	}
}
// ===================================================================================
function show_heart() {
	// id 선택자 "heart2" 인 요소에 <img> 태그를 사용하여 heart(full).png 이미지 표시
	document.querySelector("#heart2").innerHTML = '<img src="../images/heart(full).png">';
}

let heartIsFull = false;
function change_heart() {
	// 빈 하트 "클릭" 시 id 선택자 "heart1" 요소 내의 이미지를 채워진 하트로 변경
	// 1) innerHTML 활용하여 heart(full).png 이미지를 표시(덮어쓰기)
//	document.querySelector("#heart1").innerHTML = '<img src="../images/heart(full).png">';
	
	// 2) 해당 img 태그의 src 속성값만 변경
//	document.querySelector(".heart").src = "../images/heart(full).png";
	// -------------------------------------------------------------------
//	let heart = document.querySelector(".heart");
	// heart(empty) 일 때 클릭하면 heart(full) 로 변경하고
	// heart(full)일 때 클릭하면 heart(empty) 로 변경하기
	// 1) src 속성값이 heart(empty) 이면 heart(full) 로 변경, 아니면 heart(empty) 로 변경
//	console.log(heart.src);
//	if(heart.src == "http://localhost:8080/StudyJavascript/images/heart(empty).png") {
//		console.log("empty!");
//		heart.src = "../images/heart(full).png";
//	} else if(heart.src == "http://localhost:8080/StudyJavascript/images/heart(full).png"){
//		console.log("full!");
//		heart.src = "../images/heart(empty).png";
//	}
	// ------------------------------
	// 2) boolean 타입 변수를 통해 empty 와 full 을 구분하여 작업 처리
//	console.log(`heartIsFull : ${heartIsFull}`);
//	
//	if(!heartIsFull) {
//		console.log("empty!");
//		heart.src = "../images/heart(full).png";
//		// heartIsFull 변수값을 true 로 변경
////		heartIsFull = true;
//	} else if(heartIsFull){
//		console.log("full!");
//		heart.src = "../images/heart(empty).png";
//		// heartIsFull 변수값을 false 로 변경
////		heartIsFull = false;
//	}
//	// heartIsFull 변수값을 반전
//	heartIsFull = !heartIsFull;
	// ------------------------------
	// 3) class 선택자값에 따라 full 또는 empty 로 이미지 변경
//	let heartClassName = document.querySelector(".heart");
////	console.log(`heartClassName : ${heartClassName.className}`);
//	
//	if(heartClassName.className == "heart") {
//		heart.src = "../images/heart(full).png";
//		// 클래스명을 다른 이름으로 변경
//		heart.className = "heart_full";
//	}
	// => "heart_full" 로 변경 시 if 문 판별 결과가 false 가 된다!
	
	// 두 가지 class 값을 번갈아가며 설정할 때 두 클래스를 비교하기 위해
	// .heart 요소 가져와서 null 이 아니면 해당 클래스가 존재한다는 의미 
	if(document.querySelector(".heart") != null) {
		document.querySelector(".heart").src = "../images/heart(full).png";
		// 클래스명을 다른 이름으로 변경
		document.querySelector(".heart").className = "heart_full";
	} else if(document.querySelector(".heart_full") != null) {
		document.querySelector(".heart_full").src = "../images/heart(empty).png";
		document.querySelector(".heart_full").className = "heart";
	}
	// => 클래스 선택자를 판별해야하는데 클래스 선택자가 변경되면 작업이 어려워진다!
	//    이 때, id 선택자를 추가해서 id 선택자로 요소에 접근하고
	//    클래스 선택자로 상태를 판별하면 쉬워진다!
	// => 아래쪽의 change_heart2() 함수에서 작업
	
}

function change_heart2() {
	// id 선택자가 "heart" 인 요소 가져와서 변수에 저장
	let imgHeart = document.querySelector("#heart");
	console.log(imgHeart);
	console.log(imgHeart.className);
	
	// if - else if 문을 사용하여 imgHeart 의 class 속성값이 "heart_empty" or "heart_full" 인지 판별
	if(imgHeart.className == "heart_empty") {
		console.log("heart_empty");
		
		// imgHeart 의 src 속성값을 "heart(full).png" 로 변경
		imgHeart.src = "../images/heart(full).png";
		
		// imgHeart 의 class 속성값을 "heart_full" 로 변경
		imgHeart.className = "heart_full";
	} else if(imgHeart.className == "heart_full") {
		console.log("heart_full");
		
		// imgHeart 의 src 속성값을 "heart(empty).png" 로 변경
		imgHeart.src = "../images/heart(empty).png";
		
		// imgHeart 의 class 속성값을 "heart_empty" 로 변경
		imgHeart.className = "heart_empty";
	}
}

















