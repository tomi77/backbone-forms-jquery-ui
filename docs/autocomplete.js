
/*
  Backbone-Forms jQuery UI autocomplete editor 0.1.0

  Copyright (c) 2016 Tomasz Jakub Rup

  https://github.com/tomi77/backbone-forms-jquery-ui

  Released under the MIT license
 */
(function(root, factory) {

  /* istanbul ignore next */
  switch (false) {
    case !(typeof define === 'function' && define.amd):
      define(['underscore', 'backbone', 'backbone-forms', 'jquery-ui/widgets/autocomplete'], factory);
      break;
    case typeof exports !== 'object':
      require('jquery-ui/widgets/autocomplete');
      factory(require('underscore'), require('backbone'), require('backbone-forms'));
      break;
    default:
      factory(root._, root.Backbone, root.Backbone.Form);
  }
})(this, function(_, Backbone, Form) {
  Form.editors['jqueryui.autocomplete'] = Form.editors.Text.extend({
    className: 'bbf-jui-autocomplete',
    events: {
      change: 'determineChange',
      focus: function() {
        this.trigger('focus', this);
      },
      blur: function() {
        this.trigger('blur', this);
      },
      autocompleteselect: function() {
        setTimeout((function(_this) {
          return function() {
            _this.determineChange();
          };
        })(this), 0);
      }
    },
    initialize: function(options) {
      Form.editors.Text.prototype.initialize.call(this, options);
      this.editorOptions = this.schema.editorOptions || {};
      this.editorOptions.source = this.schema.options || [];
      if (this.editorOptions.source instanceof Backbone.Collection) {
        this.editorOptions.source = this.editorOptions.source.map(function(model) {
          return model.toString();
        });
      }
    },
    render: function() {
      this.$el.autocomplete(this.editorOptions);
      return Form.editors.Text.prototype.render.call(this);
    }
  });
});
