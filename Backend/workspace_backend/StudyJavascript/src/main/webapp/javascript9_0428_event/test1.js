function changeImage() {
//	document.getElementById("img1").src = "../images/1.jpg";
	document.querySelector("#img1").src = "../images/1.jpg";
}

// 이벤트 발생한 요소에서 changeImage2() 함수 호출 시 this 를 함수 전달인자로 지정하면
// 해당 img 태그 요소 자체가 객체로 함수에 전달됨
// => 따라서, document.querySelector(), document.getElementXXX() 등 생략 가능
function changeImage2(element) { 
	// changeImage2(this) 형태로 호출하면 파라미터 변수 element 에 이벤트 발생 요소 객체가 저장됨
	console.log(element);
	console.log(document.querySelector("#img2"));
	// => 두 가지 코드 모두 <img> 요소가 출력됨
	
	// element 객체(img 태그 요소)의 src 속성값을 1.jpg 로 변경
	element.src = "../images/1.jpg";
}

function changeImage3(event) { 
	// changeImage2(event) 형태로 호출하면 파라미터 변수 event 에 발생한 이벤트에 대한 객체가 저장됨
	console.log(event);
	// => PointerEvent 객체(그 중에서도 click 관련 이벤트)가 전달됨
	
	// event 객체의 target 속성(event.target)을 통해 대상 요소 객체에 접근 가능
	// => this 또는 document.querySelector() 와 동일
	console.log(event.target);
	console.log(document.querySelector("#img3"));
	// => 두 가지 코드 모두 <img> 요소가 출력됨
	
	// event 객체의 target(img 태그 요소)의 src 속성값을 1.jpg 로 변경
	event.target.src = "../images/1.jpg";
}

















