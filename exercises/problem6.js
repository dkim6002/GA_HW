function sumOfSquare(input){
	var total = 0;
	for (var i = 0; i < input; i++){
		var sum = i * i;
		total += sum;
	}
	console.log(total);
	return total;
}

function sumThenSquare(input){
	var total = 0;
	for (var i = 0; i < input; i++){
		total += i;
	}
	var sum = total * total
	console.log(sum);
	return sum
}

var total = sumOfSquare(101);
var sum = sumThenSquare(101);
var answer = sum - total
console.log(answer);