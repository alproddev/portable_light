//main menu
$(document).ready(function() {

$(function() {
		   
$('#about-list').hide();
$('div#about').mouseover(
function () {
var target = $(this).children('div');
target.slideDown(200);
});

$('div#about').mouseleave(
function () {
var target = $(this).children('div');
target.slideUp(300);
});

$('#project-list').hide();
$('div#projects').mouseover(
function () {
var target = $(this).children('div');
target.slideDown(200);
});

$('div#projects').mouseleave(
function () {
var target = $(this).children('div');
target.slideUp(300);
});

$('a[rel="external"]').attr('target','_blank');
});

$('#slideshow').cycle({
	fx: 'fade', // choose your transition type, ex: fade, scrollUp, shuffle, etc...
	pause: 8
});

$("a.fancybox").fancybox({
});

$("#mission-text-output div").not(":first").hide();
$('#mission-text-nav a').not(':first').removeClass('active');

$("#mission-text-nav a").click(function() {
  if ( $("#" + this.rel).is(":hidden") ) {
   $("#mission-text-output div").fadeOut(50);
   $("#" + this.rel).fadeIn(900);
   
   $('#mission-text-nav a').removeClass('active');
   $(this).addClass('active');
  }
});

$("#project-gallery-output div").not(":first").hide();
$('#project-gallery-nav a').not(':first').removeClass('active');

$("#project-gallery-nav a").click(function() {
  if ( $("#" + this.rel).is(":hidden") ) {
   $("#project-gallery-output div").fadeOut(50);
   $("#" + this.rel).fadeIn(900);
   
   $('#project-gallery-nav a').removeClass('active');
   $(this).addClass('active');
  }
});

});

