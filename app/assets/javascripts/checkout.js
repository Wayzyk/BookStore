$(function() {

  var checkbox = $("#trigger");
  var hidden = $("#hidden_fields");
  hidden.show();
  checkbox.change(function() {
    if (checkbox.is(':checked')) {
      hidden.hide();
    } else {
      hidden.show();
    }
  });
});
