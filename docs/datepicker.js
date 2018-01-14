
/*
  Backbone-Forms jQuery UI datepicker editor 1.0.0

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
      var prevBeforeShow, prevOnClose, prevOnSelect;
      Form.editors.Base.prototype.initialize.call(this, options);
      this.editorOptions = this.schema.editorOptions || {};
      prevOnSelect = this.editorOptions.onSelect;
      this.editorOptions.onSelect = (function(_this) {
        return function(dateText, inst) {
          _this.trigger('change', _this, dateText, inst);
          if (prevOnSelect) {
            prevOnSelect.call(_this.el, dateText, inst);
          }
        };
      })(this);
      prevOnClose = this.editorOptions.onClose;
      this.editorOptions.onClose = (function(_this) {
        return function(dateText, inst) {
          _this.trigger('blur', _this, dateText, inst);
          if (prevOnClose) {
            prevOnClose.call(_this.el, dateText, inst);
          }
        };
      })(this);
      prevBeforeShow = this.editorOptions.beforeShow;
      this.editorOptions.beforeShow = (function(_this) {
        return function(input, inst) {
          _this.trigger('focus', _this, input, inst);
          if (prevBeforeShow) {
            return prevBeforeShow.call(_this.el, input, inst);
          }
          return {};
        };
      })(this);
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
    }
  });
});
