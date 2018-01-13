
/*
  Backbone-Forms jQuery UI radio editor 0.1.0

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
  Form.editors['jqueryui.radio'] = Form.editors.Radio.extend({
    className: 'bbf-jui-radio',
    renderOptions: function(options) {
      var f;
      f = (function(_this) {
        return function() {
          _this.$('input[type=radio]').checkboxradio(_this.schema.editorOptions || {});
        };
      })(this);
      _.delay(f, this.schema.delay || 100);
      return Form.editors.Radio.prototype.renderOptions.call(this, options);
    }
  });
});
