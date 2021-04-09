toggleMoreLessLink = function(content, link) {
  if (content.is(':visible')) {
    link.text('less');
  } else {
    link.text('more');
  }
}

$(document).ready(function() {
  $('a').css('outline', '0');

  $('.rest_o_body').hide();

  $('p a.hide_show').click(function(e){
    var link = $(this);
    var content = $(link.parent().siblings('.rest_o_body').get(0));
    content.toggle();
    toggleMoreLessLink(content, link)
    e.preventDefault();
  });

  $('div.hide_show').click(function(e){
    var div = $(this);
    var content = $(div.siblings('.rest_o_body').get(0));
    content.toggle();
    toggleMoreLessLink(content, link)
    e.preventDefault();
  });

  $('#highlight_box').cycle({ 
      timeout: 0, 
      pager:  '#highlight_box_nav', 
      pagerAnchorBuilder: function(idx, slide) { 
          return '#highlight_box_nav li:eq(' + idx + ') a'; 
      } 
  });

});
