// Get the modal
// var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
// window.onclick = function(event) {
// if (event.target == modal) {
// modal.style.display = "none";
// }
// }

// window.onload = function() {
//	
//
// }

//function displayFun(on1, off1, off2) {
//	document.getElementById(on1).style.display = 'block';
//	document.getElementById(off1).style.display = 'none';
//	document.getElementById(off2).style.display = 'none';
//}

function closeFun() {
	$.ajax({
		url : "/mk/resources/ajax/login.jsp",
		success : function(data) {
			$("#page").html(data);
		}
	})

	var input = document.getElementsByTagName('input');
	for (var i = 0; i < input.length; i++) {
		input[i].value = "";
	}
}

// function closeFun(close) {
// document.getElementById(close).style.display = 'none';
// document.getElementById(open).style.display = 'block';
// var input = document.getElementsByTagName('input');
// for (var i = 0; i < input.length; i++) {
// input[i].value = "";
// }
// document.getElementById('resultID').innerText = "";
// }
