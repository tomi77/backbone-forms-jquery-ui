# Backbone-Forms jQuery UI editors

[![Build Status](https://travis-ci.org/tomi77/backbone-forms-jquery-ui.svg?branch=master)](https://travis-ci.org/tomi77/backbone-forms-jquery-ui)
[![Code Climate](https://codeclimate.com/github/tomi77/backbone-forms-jquery-ui/badges/gpa.svg)](https://codeclimate.com/github/tomi77/backbone-forms-jquery-ui)
[![dependencies Status](https://david-dm.org/tomi77/backbone-forms-jquery-ui/status.svg)](https://david-dm.org/tomi77/backbone-forms-jquery-ui)
[![devDependencies Status](https://david-dm.org/tomi77/backbone-forms-jquery-ui/dev-status.svg)](https://david-dm.org/tomi77/backbone-forms-jquery-ui?type=dev)
![Downloads](https://img.shields.io/npm/dt/backbone-forms-jquery-ui.svg)

A [Backbone-Forms](https://github.com/powmedia/backbone-forms) [jQuery UI](https://jqueryui.com/) related editors

## Table of contents

* [Installation](#installation)
* [jQuery UI editors](#editors)
  * [autocomplete](#autocomplete)
  * [checkbox](#checkbox)
  * [checkboxes](#checkboxes)
  * [datepicker](#datepicker)
  * [radio](#radio)
  * [selectmenu](#selectmenu)
  * [slider](#slider)
  * [spinner](#spinner)

## Installation

Bower:

~~~bash
bower install backbone-forms-jquery-ui
~~~

NPM:

~~~bash
npm install backbone backbone-forms backbone-forms-jquery-ui
~~~

## jQuery UI editors

### autocomplete

#### Schema options

`options` - Array of strings or Backbone Collection

`editorOptions` - jQuery UI autocomplete options

#### Example

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
~~~

[Demo](https://tomi77.github.io/backbone-forms-jquery-ui/autocomplete.html)

### checkbox

#### Schema options

`editorOptions` - jQuery UI selectmenu options

#### Example

~~~js
var form = new Backbone.Form({
  schema: {
    val: {
      type: 'jqueryui.checkbox',
      title: 'Val'
    }
  }
});
~~~

[Demo](https://tomi77.github.io/backbone-forms-jquery-ui/checkbox.html)

### checkboxes

#### Schema options

`editorOptions` - jQuery UI selectmenu options

#### Example

~~~js
var form = new Backbone.Form({
  schema: {
    val: {
      type: 'jqueryui.checkboxes',
      title: 'Val',
      options: ['1', '2', '3']
    }
  }
});
~~~

[Demo](https://tomi77.github.io/backbone-forms-jquery-ui/checkboxes.html)

### datepicker

#### Schema options

`editorOptions` - jQuery UI datepicker options

#### Example

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
~~~

[Demo](https://tomi77.github.io/backbone-forms-jquery-ui/datepicker.html)

### radio

#### Schema options

`editorOptions` - jQuery UI selectmenu options

#### Example

~~~js
var form = new Backbone.Form({
  schema: {
    val: {
      type: 'jqueryui.radio',
      title: 'Val',
      options: ['1', '2', '3']
    }
  }
});
~~~

[Demo](https://tomi77.github.io/backbone-forms-jquery-ui/radio.html)

### selectmenu

#### Schema options

`options` - Array of strings or Backbone Collection

`editorOptions` - jQuery UI selectmenu options

#### Example

~~~js
var form = new Backbone.Form({
  schema: {
    speed: {
      type: 'jqueryui.selectmenu',
      title: 'Speed',
      options: ['Slower', 'Slow', 'Medium', 'Fast', 'Faster']
    }
  }
});
~~~

[Demo](https://tomi77.github.io/backbone-forms-jquery-ui/selectmenu.html)

### slider

#### Schema options

`editorOptions` - jQuery UI selectmenu options

#### Example

~~~js
var form = new Backbone.Form({
  schema: {
    val: {
      type: 'jqueryui.slide',
      title: 'Val'
    }
  }
});
~~~

[Demo](https://tomi77.github.io/backbone-forms-jquery-ui/slider.html)

### spinner

#### Schema options

`editorOptions` - jQuery UI selectmenu options

#### Example

~~~js
var form = new Backbone.Form({
  schema: {
    val: {
      type: 'jqueryui.spinner',
      title: 'Val',
      editorOptions: {
        min: 0,
        max: 100,
        page: 10
      }
    }
  }
});
~~~

[Demo](https://tomi77.github.io/backbone-forms-jquery-ui/spinner.html)
