var loaded = false;
var example = function () {
  if(loaded) return;
  loaded = true;
  var form = new Backbone.Form({
    schema: {
      slider: {
        type: 'jqueryui.slider',
        title: 'Val'
      }
    }
  });
  var editor = form.getEditor('slider');
  editor.on('change', function(editor) {
    $('.change span').html(editor.getValue());
  }).on('focus', function(editor) {
    $('.focus').removeClass('hidden');
    $('.blur').addClass('hidden');
  }).on('blur', function(editor) {
    $('.focus').addClass('hidden');
    $('.blur').removeClass('hidden');
  });
  $('#form').html(form.render().$el);
  editor.trigger('change', editor).trigger('blur', editor);
};
document.addEventListener("DOMContentLoaded", example, false);
window.addEventListener("load", example, false);
