# Backbone-Forms jQuery UI editors

[![Code Climate](https://codeclimate.com/github/tomi77/backbone-forms-jquery-ui/badges/gpa.svg)](https://codeclimate.com/github/tomi77/backbone-forms-jquery-ui)

## Installation

~~~bash
bower install backbone-forms-jquery-ui
~~~

## Editors

### jQuery UI datepicker editor

~~~coffee-script
form = new Backbone.Form
  schema:
    date:
      type: 'jqueryui.datepicker'
      title: 'Date'
      editorOptions:
        numberOfMonths: [2, 3]
$('#form').html form.render().$el
~~~

~~~js
var form = new Backbone.Form({
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
$('#form').html(form.render().$el);
~~~

[Demo](https://tomi77.github.io/backbone-forms-jquery-ui/datepicker.html)
