
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
    tagName: 'input',
    className: 'bbf-jui-spinner',
    initialize: function(options) {
      Form.editors.Text.prototype.initialize.call(this, options);
      this.editorOptions = this.schema.editorOptions || {};
    },
    render: function() {
      var f;
      f = (function(_this) {
        return function() {
          return _this.$el.spinner(_this.editorOptions || {});
        };
      })(this);
      _.delay(f, this.schema.delay || 100);
      return Form.editors.Text.prototype.render.call(this);
    }
  });
});
