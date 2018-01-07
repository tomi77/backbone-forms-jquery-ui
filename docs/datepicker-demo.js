var loaded = false;
var example = function () {
  if(loaded) return;
  loaded = true;
  var form = new Backbone.Form({
    model: new Backbone.Model({
      date: new Date(2018, 0, 1)
    }),
    schema: {
      date: {
        type: 'jqueryui.datepicker',
        title: 'Date',
        editorOptions: {
          numberOfMonths: [2, 3]
        }
      }
    }
  });
  var editor = form.getEditor('date');
  editor.on('change', function(editor) {
    $('.change span').html(editor.getValue().toLocaleFormat('%Y-%m-%d'));
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
