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
      'selectmenuopen': () ->
        @trigger 'focus', @
        return
      'selectmenuclose': () ->
        @trigger 'blur', @
        return
      'selectmenuselect': () ->
        @trigger 'change', @
        return

    initialize: (options) ->
      Form.editors.Select::initialize.call @, options

      @editorOptions = @schema.editorOptions or {}

      [@$select, @$el] = [@$el, Backbone.$ '<div>']
      @el = @$el[0]
      @$el.html @$select

      return

    renderOptions: (options) ->
      html = @_getOptionsHtml options
      @$select.html html
      @$select.selectmenu @editorOptions
      @setValue @value
      return

    getValue: () -> @$select.val()

    setValue: (val) ->
      @$select.val val
      @$select.selectmenu 'refresh'
      return

    focus: () ->
      if @hasFocus then return
      @$select.selectmenu 'open'
      return

    blur: () ->
      if not @hasFocus then return
      @$select.selectmenu 'close'
      return

    change: () ->
      @trigger 'change', @
      return

  return
