
/*
  Backbone-Forms jQuery UI checkbox editor 0.1.0

  Copyright (c) 2016 Tomasz Jakub Rup

  https://github.com/tomi77/backbone-forms-jquery-ui

  Released under the MIT license
 */
(function(root, factory) {

  /* istanbul ignore next */
  switch (false) {
    case !(typeof define === 'function' && define.amd):
      define(['backbone-forms', 'jquery-ui/widgets/checkboxradio'], factory);
      break;
    case typeof exports !== 'object':
      require('jquery-ui/widgets/checkboxradio');
      factory(require('backbone-forms'));
      break;
    default:
      factory(root.Backbone.Form);
  }
})(this, function(Form) {
  Form.editors['jqueryui.checkbox'] = Form.editors.Checkbox.extend({
    className: 'bbf-jui-checkbox',
    initialize: function(options) {
      var $label, ref;
      Form.editors.Checkbox.prototype.initialize.call(this, options);
      this.editorOptions = this.schema.editorOptions || {};
      ref = [this.$el, Backbone.$('<div>'), Backbone.$("<label for='" + this.id + "'>")], this.$input = ref[0], this.$el = ref[1], $label = ref[2];
      this.el = this.$el[0];
      $label.html('&nbsp;');
      this.$el.html(this.$input);
      this.$el.append($label);
    },
    render: function() {
      this.$input.checkboxradio(this.editorOptions);
      return Form.editors.Checkbox.prototype.render.call(this);
    },
    getValue: function() {
      return this.$input.prop('checked');
    },
    setValue: function(value) {
      this.$input.prop('checked', value === true);
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
    }
  });
});
