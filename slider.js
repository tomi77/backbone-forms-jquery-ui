
/*
  Backbone-Forms jQuery UI slider editor 1.0.0

  Copyright (c) 2016 Tomasz Jakub Rup

  https://github.com/tomi77/backbone-forms-jquery-ui

  Released under the MIT license
 */
(function(root, factory) {

  /* istanbul ignore next */
  switch (false) {
    case !(typeof define === 'function' && define.amd):
      define(['backbone-forms', 'jquery-ui/widgets/slider'], factory);
      break;
    case typeof exports !== 'object':
      require('jquery-ui/widgets/slider');
      factory(require('backbone-forms'));
      break;
    default:
      factory(root.Backbone.Form);
  }
})(this, function(Form) {
  Form.editors['jqueryui.slider'] = Form.Editor.extend({
    className: 'bbf-jui-slider',
    events: {
      'slidestart': 'focus',
      'slidestop': 'blur',
      'slidechange': 'change'
    },
    initialize: function(options) {
      Form.editors.Base.prototype.initialize.call(this, options);
      this.editorOptions = this.schema.editorOptions || {};
    },
    render: function() {
      this.$el.slider(this.editorOptions);
      this.setValue(this.value);
      return this;
    },
    getValue: function() {
      return this.$el.slider('option', 'value');
    },
    setValue: function(value) {
      this.$el.datepicker('option', 'value', value);
    },
    focus: function() {
      this.trigger('focus', this);
    },
    blur: function() {
      this.trigger('blur', this);
    },
    change: function() {
      this.trigger('change', this);
    }
  });
});
