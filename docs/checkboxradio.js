
/*
  Backbone-Forms jQuery UI checkboxradio editors 0.1.0

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
    render: function() {
      var f;
      f = (function(_this) {
        return function() {
          _this.$el.checkboxradio(_this.schema.editorOptions || {});
        };
      })(this);
      _.delay(f, this.schema.delay || 100);
      return Form.editors.Checkbox.prototype.render.call(this);
    }
  });
  Form.editors['jqueryui.checkboxes'] = Form.editors.Checkboxes.extend({
    className: 'bbf-jui-checkboxes',
    initialize: function(options) {
      var el, ref;
      Form.editors.Checkboxes.prototype.initialize.call(this, options);
      this.editorOptions = this.schema.editorOptions || {};
      ref = [this.$el, Backbone.$('<div>')], el = ref[0], this.$el = ref[1];
      this.el = this.$el[0];
      this.$el.html(el);
    },
    renderOptions: function(options) {
      Form.editors.Checkboxes.prototype.renderOptions.call(this, options);
      this.$('input[type=checkbox]').checkboxradio(this.editorOptions);
    }
  });
  Form.editors['jqueryui.radio'] = Form.editors.Radio.extend({
    className: 'bbf-jui-radio',
    initialize: function(options) {
      var el, ref;
      Form.editors.Radio.prototype.initialize.call(this, options);
      this.editorOptions = this.schema.editorOptions || {};
      ref = [this.$el, Backbone.$('<div>')], el = ref[0], this.$el = ref[1];
      this.el = this.$el[0];
      this.$el.html(el);
    },
    renderOptions: function(options) {
      var f;
      Form.editors.Radio.prototype.renderOptions.call(this, options);
      f = (function(_this) {
        return function() {
          _this.$('input[type=radio]').checkboxradio(_this.editorOptions);
        };
      })(this);
      _.delay(f, this.schema.delay || 100);
    }
  });
});
