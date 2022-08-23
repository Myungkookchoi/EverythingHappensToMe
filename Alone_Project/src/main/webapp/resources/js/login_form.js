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

function displayFun(on1, off1, off2) {
	document.getElementById(on1).style.display = 'block';
	document.getElementById(off1).style.display = 'none';
	document.getElementById(off2).style.display = 'none';
}

function closeFun(close, open) {
	document.getElementById(close).style.display = 'none';
	document.getElementById(open).style.display = 'block';
}
