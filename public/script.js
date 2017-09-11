function test()
{
	var x = window.localStorage.getItem('a');
	window.localStorage.setItem('a', 'HI');
	alert(x);
}