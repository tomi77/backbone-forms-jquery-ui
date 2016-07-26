# Backbone-Forms jQuery UI editors

[![Code Climate](https://codeclimate.com/github/tomi77/backbone-forms-jquery-ui/badges/gpa.svg)](https://codeclimate.com/github/tomi77/backbone-forms-jquery-ui)

## Installation

~~~bash
bower install backbone-forms-jquery-ui
~~~

## Editors

### jQuery UI autocomplete editor

#### Schema options

`options` - Array of strings or Backbone Collection

`editorOptions` - jQuery UI autocomplete options

#### CoffeeScript Example

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

#### JavaScript Example

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

[Demo](https://tomi77.github.io/backbone-forms-jquery-ui/autocomplete.html)

### jQuery UI datepicker editor

#### Schema options

`editorOptions` - jQuery UI datepicker options

#### CoffeeScript Example

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

#### JavaScript Example

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

### jQuery UI selectmenu editor

#### Schema options

`options` - Array of strings or Backbone Collection

`editorOptions` - jQuery UI selectmenu options

`delay` - Delay of render selectmenu. This widget must be rendered in main DOM tree, not in virtual DOM element.

#### CoffeeScript Example

~~~coffee-script
form = new Backbone.Form
  schema:
    speed:
      type: 'jqueryui.selectmenu'
      title: 'Speed'
      options: ['Slower', 'Slow', 'Medium', 'Fast', 'Faster']
      delay: 200
$('#form').html form.render().$el
~~~

#### JavaScript Example

~~~js
var form = new Backbone.Form({
schema: {
  speed: {
    type: 'jqueryui.selectmenu',
    title: 'Speed',
    options: ['Slower', 'Slow', 'Medium', 'Fast', 'Faster'],
    delay: 200
  }
}
});
$('#form').html(form.render().$el);
~~~

[Demo](https://tomi77.github.io/backbone-forms-jquery-ui/selectmenu.html)

### jQuery UI slider editor

#### Schema options

`editorOptions` - jQuery UI selectmenu options

#### CoffeeScript Example

~~~coffee-script
form = new Backbone.Form
  schema:
    val:
      type: 'jqueryui.slide'
      title: 'Val'
$('#form').html form.render().$el
~~~

#### JavaScript Example

~~~js
var form = new Backbone.Form({
schema: {
  val: {
    type: 'jqueryui.slide',
    title: 'Val'
  }
}
});
$('#form').html(form.render().$el);
~~~

[Demo](https://tomi77.github.io/backbone-forms-jquery-ui/slide.html)

## TODO

* spinner
* controlgroup
* checkboxradio
