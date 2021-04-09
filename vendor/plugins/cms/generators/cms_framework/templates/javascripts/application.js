$.ajaxSetup({ 
  'beforeSend': function(xhr) { xhr.setRequestHeader("Accept", "text/javascript") }
});

$(document).ajaxSend(function(event, request, settings) {
  if (typeof(AUTH_TOKEN) == "undefined") return;
  // settings.data is a serialized string like "foo=bar&baz=boink" (or null)
  settings.data = settings.data || "";
  settings.data += (settings.data ? "&" : "") + "authenticity_token=" + encodeURIComponent(AUTH_TOKEN);
});

var resetZebraStripes = function() {
  $("tbody tr").removeClass("odd");
  $("tbody tr:nth-child(odd)").addClass("odd");
}

jQuery.fn.makeSortable = function(sort_path, authenticity_token) {
  var el = $(this);
  el.tableDnD({
    onDrop: function(table, row) {
      $.ajax({
        type: "POST",
        url: sort_path,
        processData: false,
        data: $.tableDnD.serialize() + '&authenticity_token=' + encodeURIComponent(authenticity_token),
        success: function(msg) {
          resetZebraStripes();
          el.effect("highlight", {}, 1000);
        }
      });
    }
  });
};

$(document).ready(function() {
  $('form.destroy').bind("submit", function() {
    if (!confirm("Are you sure you want to destroy this item?")) {
      return false;
    }
  });

  $("tbody tr:nth-child(odd)").addClass("odd");

  $(".cl_form form").validate({
    highlight: function(element, errorClass) {
      $(element).parent().addClass(errorClass);
    },
    unhighlight: function(element, errorClass) {
      $(element).parent().removeClass(errorClass);
    }
  });
});
