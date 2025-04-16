function btnClick(){
	alert("버튼4 클릭");
}

function btnClick2(char){
	alert(`${char}`)
}

function btnClick3(num1, num2){
//	let sum = num1 + num2;
//	alert(`${num1} + ${num2} = ${sum}`)
	alert(`${num1} + ${num2} = ${num1 + num2}`)
}

function startNumberGame() {
	let correctNum = 5;
	let t = 1;
	let num = prompt(`숫자를 입력하세요!`);
	if(Number(num) !== NaN){
		while(true){
			if (num == correctNum){
				alert(`${t}번만에 정답입니다!`)
				break
			} else if(num > correctNum){
				alert(`입력한 숫자보다 정답이 작습니다!`)
				num = prompt(`숫자를 입력하세요!`);

			} else if(num < correctNum){
				alert(`입력한 숫자보다 정답이 큽니다!`)
				num = prompt(`숫자를 입력하세요!`);
			}
			t++
		}
	} else {
		alert(`게임을 종료합니다.`);
		return

	}
	
	
	
	
	
}

