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

	update_orders_input();
}

function update_orders_input()
{
	var orders = cart_get_orders();
	$('#orders_input').val(orders);
}

function cart_get_number_of_items()
{
	var count = 0;
	for (var i = 0; i < window.localStorage.length; i++)
	{
		var key = window.localStorage.key(i);
		var value = window.localStorage.getItem(key);

		if (key.includes('product_') == true)
		{
			count = count + value * 1;
		}

	}

	return count;
}

function cart_get_orders()
{
	var orders = '';
	for (var i = 0; i < window.localStorage.length; i++)
	{
		var key = window.localStorage.key(i);
		var value = window.localStorage.getItem(key);

		if (key.includes('product_') == true)
		{
			orders = orders + key + '=' + value + ',';
		}

	}

	return orders;
}