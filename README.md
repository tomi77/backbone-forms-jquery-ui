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

### jQuery UI autocomplete editor

~~~coffee-script
states = ['Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California',
  'Colorado', 'Connecticut', 'Delaware', 'Florida', 'Georgia', 'Hawaii',
  'Idaho', 'Illinois', 'Indiana', 'Iowa', 'Kansas', 'Kentucky', 'Louisiana',
  'Maine', 'Maryland', 'Massachusetts', 'Michigan', 'Minnesota',
  'Mississippi', 'Missouri', 'Montana', 'Nebraska', 'Nevada', 'New Hampshire',
  'New Jersey', 'New Mexico', 'New York', 'North Carolina', 'North Dakota',
  'Ohio', 'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island',
  'South Carolina', 'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont',
  'Virginia', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming'
]

form = new Backbone.Form
  schema:
    states:
      type: 'jqueryui.autocomplete'
      title: 'States'
      options: states
      editorOptions:
        minLength: 2
$('#form').html form.render().$el
~~~

~~~js
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
$('#form').html(form.render().$el);
~~~

[Demo](https://tomi77.github.io/backbone-forms-jquery-ui/datepicker.html)
