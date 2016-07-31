###
  Backbone-Forms jQuery UI selectmenu editor 0.1.0

  Copyright (c) 2016 Tomasz Jakub Rup

  https://github.com/tomi77/backbone-forms-jquery-ui

  Released under the MIT license
###

((root, factory) ->
  ### istanbul ignore next ###
  switch
    when typeof define is 'function' and define.amd
      define ['underscore', 'backbone', 'backbone-forms', 'jquery-ui/widgets/selectmenu'], factory
    when typeof exports is 'object'
      require('jquery-ui/widgets/selectmenu')
      factory require('underscore'), require('backbone'), require('backbone-forms')
    else
      factory root._, root.Backbone, root.Backbone.Form
  return
) @, (_, Backbone, Form) ->
  Form.editors['jqueryui.selectmenu'] = Form.editors.Select.extend
    className: 'bbf-jui-selectmenu'

    events:
      'selectmenuopen': 'focus'
      'selectmenuclose': 'blur'
      'selectmenuselect': 'change'

    renderOptions: (options) ->
      f = () =>
        @$el.selectmenu @schema.editorOptions or {}
        return
      _.delay f, @schema.delay or 100
      Form.editors.Select::renderOptions.call @, options
      return

    focus: () ->
      @trigger 'focus', @
      return

    blur: () ->
      @trigger 'blur', @
      return

    change: () ->
      @trigger 'change', @
      return

  return
