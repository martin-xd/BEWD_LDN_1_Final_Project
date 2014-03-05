# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
	total_purchase_value =  0
	total_current_value =  0
	format_currency = (value) ->
		return parseFloat(value).toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, '$1,')
	purchase_value_cells = $(".purchase_value");
	if purchase_value_cells.length > 0
		
		values =$.map purchase_value_cells, (object, i)->
			total_purchase_value += parseFloat($(object).text())
		$("#total_purchase_value").text(format_currency(total_purchase_value));


	current_value_cells = $(".current_value");
	if current_value_cells.length > 0
		
		values =$.map current_value_cells, (object, i)->
			total_current_value += parseFloat($(object).text())
		$("#total_current_value").text(format_currency(total_current_value));

	$(".price_value, .current_value, .purchase_value").text ->
		initial_value = $(this).text()
		format_currency(initial_value)

	$("#total_difference").text ->
		final_difference = total_current_value - total_purchase_value
		if final_difference> 0
			$(this).addClass("positive-difference")
		else
			$(this).addClass("negative-difference")
		format_currency(final_difference)