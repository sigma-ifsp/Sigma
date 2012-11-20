// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require raphael.min
//= require morris.min
//= require jquery-ui.min
//= require bootstrap
//= require_tree .

$(document).ready(function() {
  $('.carousel').carousel({
    interval: 5000
  });

  $("#content").click(function(e){
    var x = e.pageX - this.offsetLeft;
    var y = e.pageY - this.offsetTop;
    var path = window.location.pathname;
    var url = "http://ux.sigmafidelidade.com.br/click?x=" + x + "&y=" + y + "&path=" + path;
    var img = new Image();
    img.src = url;
  });
});
