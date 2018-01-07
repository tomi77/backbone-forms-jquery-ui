var loaded = false;
var example = function () {
  if(loaded) return;
  loaded = true;
  var states = ['Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California',
    'Colorado', 'Connecticut', 'Delaware', 'Florida', 'Georgia', 'Hawaii',
    'Idaho', 'Illinois', 'Indiana', 'Iowa', 'Kansas', 'Kentucky', 'Louisiana',
    'Maine', 'Maryland', 'Massachusetts', 'Michigan', 'Minnesota',
    'Mississippi', 'Missouri', 'Montana', 'Nebraska', 'Nevada', 'New Hampshire',
    'New Jersey', 'New Mexico', 'New York', 'North Carolina', 'North Dakota',
    'Ohio', 'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island',
    'South Carolina', 'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont',
    'Virginia', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming'
  ];

  var form = new Backbone.Form({
    schema: {
      state: {
        type: 'jqueryui.autocomplete',
        title: 'State',
        options: states,
        editorOptions: {
          minLength: 2
        }
      }
    }
  });
  var editor = form.getEditor('state');
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
  editor.trigger('blur', editor);
};
document.addEventListener("DOMContentLoaded", example, false);
window.addEventListener("load", example, false);
