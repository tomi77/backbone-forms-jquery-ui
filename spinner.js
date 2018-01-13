
/*
  Backbone-Forms jQuery UI spinner editor 0.1.0

  Copyright (c) 2016 Tomasz Jakub Rup

  https://github.com/tomi77/backbone-forms-jquery-ui

  Released under the MIT license
 */
(function(root, factory) {

  /* istanbul ignore next */
  switch (false) {
    case !(typeof define === 'function' && define.amd):
      define(['underscore', 'backbone', 'backbone-forms', 'jquery-ui/widgets/spinner'], factory);
      break;
    case typeof exports !== 'object':
      require('jquery-ui/widgets/spinner');
      factory(require('underscore'), require('backbone'), require('backbone-forms'));
      break;
    default:
      factory(root._, root.Backbone, root.Backbone.Form);
  }
})(this, function(_, Backbone, Form) {
  Form.editors['jqueryui.spinner'] = Form.editors.Text.extend({
    className: 'bbf-jui-spinner',
    events: {
      focus: function(event) {
        this.trigger('focus', this);
      },
      blur: function(event) {
        this.trigger('blur', this);
      },
      spinstop: function() {
        this.trigger('change', this);
      }
    },
    initialize: function(options) {
      var ref;
      Form.editors.Text.prototype.initialize.call(this, options);
      this.editorOptions = this.schema.editorOptions || {};
      ref = [this.$el, Backbone.$('<div>')], this.$input = ref[0], this.$el = ref[1];
      this.el = this.$el[0];
      this.$el.html(this.$input);
    },
    render: function() {
      this.$input.spinner(this.editorOptions);
      return Form.editors.Text.prototype.render.call(this);
    },
    determineChange: function(event) {
      var changed, currentValue;
      currentValue = this.$input.val();
      changed = currentValue !== this.previousValue;
      if (changed) {
        this.previousValue = currentValue;
        this.trigger('change', this);
      }
    },
    getValue: function() {
      return this.$input.val();
    },
    setValue: function(val) {
      this.$input.val(val);
    },
    focus: function() {
      if (this.hasFocus) {
        return;
      }
      this.$input.focus();
    },
    blur: function() {
      if (!this.hasFocus) {
        return;
      }
      this.$input.blur();
    },
    select: function() {
      this.$input.select();
    }
  });
});
