function test()
{
	var x = window.localStorage.getItem('a');
	//x = x * 1 + 1
	window.localStorage.setItem('a', x);
	alert(x);
}

function add_to_cart(id)
{
	var key = 'product_' + id;
	
	var x = window.localStorage.getItem(key);
	x = x * 1 + 1;
	window.localStorage.setItem(key, x);
}