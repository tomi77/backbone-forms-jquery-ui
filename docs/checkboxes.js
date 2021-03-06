
/*
  Backbone-Forms jQuery UI checkboxes editor 1.0.0

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
  Form.editors['jqueryui.checkboxes'] = Form.editors.Checkboxes.extend({
    className: 'bbf-jui-checkboxes',
    initialize: function(options) {
      Form.editors.Checkboxes.prototype.initialize.call(this, options);
      this.editorOptions = this.schema.editorOptions || {};
    },
    renderOptions: function(options) {
      Form.editors.Checkboxes.prototype.renderOptions.call(this, options);
      this.$('input[type=checkbox]').checkboxradio(this.editorOptions);
    }
  });
});
