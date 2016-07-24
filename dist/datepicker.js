
/*
  Backbone-Forms jQuery UI datepicker editor 0.1.0

  Copyright (c) 2016 Tomasz Jakub Rup

  https://github.com/tomi77/backbone-forms-jquery-ui

  Released under the MIT license
 */
(function(root, factory) {

  /* istanbul ignore next */
  switch (false) {
    case !(typeof define === 'function' && define.amd):
      define(['underscore', 'backbone-forms', 'jquery-ui/widgets/datepicker'], factory);
      break;
    case typeof exports !== 'object':
      require('jquery-ui/widgets/datepicker');
      factory(require('underscore'), require('backbone-forms'));
      break;
    default:
      factory(root._, root.Backbone.Form);
  }
})(this, function(_, Form) {
  Form.editors['jqueryui.datepicker'] = Form.Editor.extend({
    className: 'bbf-jui-datepicker',
    tagName: 'input',
    initialize: function(options) {
      _.bindAll(this, 'focus', 'blur', 'change');
      Form.editors.Base.prototype.initialize.call(this, options);
      this.editorOptions = _.extend(this.schema.editorOptions || {}, {
        onSelect: this.change,
        onClose: this.blur,
        beforeShow: this.focus
      });
      this.value = (function() {
        switch (false) {
          case !(this.value && _.isDate(this.value)):
            return this.value;
          case !(this.value && _.isString(this.value)):
            return new Date(this.value);
          default:
            return new Date();
        }
      }).call(this);
      this.$el.attr('type', 'text');
    },
    render: function() {
      this.$el.datepicker(this.editorOptions);
      this.setValue(this.value);
      return this;
    },

    /*
    @return {Date}   Selected date
     */
    getValue: function() {
      return this.$el.datepicker('getDate');
    },
    setValue: function(value) {
      this.$el.datepicker('setDate', value);
    },
    focus: function() {
      if (!this.hasFocus) {
        this.trigger('focus', this);
      }
      return {};
    },
    blur: function() {
      if (this.hasFocus) {
        this.trigger('blur', this);
      }
    },
    change: function() {
      this.trigger('change', this);
    }
  });
});
