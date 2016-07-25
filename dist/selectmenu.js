
/*
  Backbone-Forms jQuery UI selectmenu editor 0.1.0

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
    renderOptions: function(options) {
      var f;
      f = (function(_this) {
        return function() {
          return _this.$el.selectmenu(_this.schema.editorOptions || {});
        };
      })(this);
      _.delay(f, this.schema.delay || 100);
      Form.editors.Select.prototype.renderOptions.call(this, options);
    }
  });
});
