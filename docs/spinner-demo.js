var loaded = false;
var example = function () {
  if(loaded) return;
  loaded = true;
  var form = new Backbone.Form({
    schema: {
      spinner: {
        type: 'jqueryui.spinner',
        title: 'Val',
        editorOptions: {
          min: 0,
          max: 100,
          page: 10
        },
        value: 0
      }
    },
    model: new Backbone.Model({
      spinner: 0
    })
  });
  var editor = form.getEditor('spinner');
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
