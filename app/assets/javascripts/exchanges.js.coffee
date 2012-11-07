# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  Morris.Line
    element: 'graphs'
    data: $('#graphs').data('exchanges')
    xkey: 'day'
    ykeys: ['total']
    labels: ['Total per day']

  $("#graph_start,#graph_ending").datepicker
    changeMonth: true
    changeYear: true
