
/*
  Backbone-Forms jQuery UI editors 0.1.0

  Copyright (c) 2016 Tomasz Jakub Rup

  https://github.com/tomi77/backbone-forms-jquery-ui

  Released under the MIT license
 */
(function(root, factory) {

  /* istanbul ignore next */
  switch (false) {
    case !(typeof define === 'function' && define.amd):
      define(['underscore', 'backbone-forms', 'jquery-ui'], factory);
      break;
    case typeof exports !== 'object':
      require('jquery-ui');
      factory(require('underscore'), require('backbone-forms'));
      break;
    default:
      factory(root._, root.Backbone.Form);
  }
})(this, function(_, Form) {
  return Form.editors['jqueryui.Date'] = Form.Editor.extend({
    className: 'bbf-jui-date',
    render: function() {
      this.$el.html('<input type="text">');
      this.$('input').datepicker();
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
      this.setValue(this.value);
      this._observeDatepickerEvents();
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
        this.$el.datepicker('show');
      }
    },
    blur: function() {
      if (this.hasFocus) {
        this.$el.datepicker('hide');
      }
    },
    _observeDatepickerEvents: function() {
      this.$el.datepicker('option', 'onSelect', (function(_this) {
        return function() {
          _this.trigger('change', _this);
        };
      })(this));
      this.$el.datepicker('option', 'onClose', (function(_this) {
        return function() {
          if (_this.hasFocus) {
            _this.trigger('blur', _this);
          }
        };
      })(this));
      return this.$el.datepicker('option', 'beforeShow', (function(_this) {
        return function() {
          if (!_this.hasFocus) {
            _this.trigger('focus', _this);
          }
          return {};
        };
      })(this));
    }
  });
});