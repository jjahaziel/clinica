# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).on "page:change", ->
	$('#servicios').dataTable
	  processing: true
	  serverSide: true
	  ajaxSource: $('#servicios').data('source')
	  pagingType: 'full_numbers'
	  bJQueryUI: true
	  columns: [ 
	  	{ } 
	  	{ } 
	  	{ } 
	  	{ } 
	  	{ } 
	  	{ } 
	  	{ } 
	  	{ "bSortable": false } 
	  	{ "bSortable": false } 
	  ] 