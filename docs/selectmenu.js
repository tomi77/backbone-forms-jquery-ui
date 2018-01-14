
/*
  Backbone-Forms jQuery UI selectmenu editor 1.0.0

  Copyright (c) 2016 Tomasz Jakub Rup

  https://github.com/tomi77/backbone-forms-jquery-ui

  Released under the MIT license
 */
(function(root, factory) {

  /* istanbul ignore next */
  switch (false) {
    case !(typeof define === 'function' && define.amd):
      define(['underscore', 'backbone', 'backbone-forms', 'jquery-ui/widgets/selectmenu'], factory);
      break;
    case typeof exports !== 'object':
      require('jquery-ui/widgets/selectmenu');
      factory(require('underscore'), require('backbone'), require('backbone-forms'));
      break;
    default:
      factory(root._, root.Backbone, root.Backbone.Form);
  }
})(this, function(_, Backbone, Form) {
  Form.editors['jqueryui.selectmenu'] = Form.editors.Select.extend({
    className: 'bbf-jui-selectmenu',
    events: {
      'selectmenuopen': function() {
        this.trigger('focus', this);
      },
      'selectmenuclose': function() {
        this.trigger('blur', this);
      },
      'selectmenuselect': function() {
        this.trigger('change', this);
      }
    },
    initialize: function(options) {
      var ref;
      Form.editors.Select.prototype.initialize.call(this, options);
      this.editorOptions = this.schema.editorOptions || {};
      ref = [this.$el, Backbone.$('<div>')], this.$input = ref[0], this.$el = ref[1];
      this.el = this.$el[0];
      this.$el.html(this.$input);
    },
    renderOptions: function(options) {
      var html;
      html = this._getOptionsHtml(options);
      this.$input.html(html);
      this.$input.selectmenu(this.editorOptions);
      this.setValue(this.value);
    },
    getValue: function() {
      return this.$input.val();
    },
    setValue: function(val) {
      this.$input.val(val);
      this.$input.selectmenu('refresh');
    },
    focus: function() {
      if (this.hasFocus) {
        return;
      }
      this.$input.selectmenu('open');
    },
    blur: function() {
      if (!this.hasFocus) {
        return;
      }
      this.$input.selectmenu('close');
    },
    change: function() {
      this.trigger('change', this);
    }
  });
});
