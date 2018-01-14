###
  Backbone-Forms jQuery UI selectmenu editor 1.0.0

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

      [@$input, @$el] = [@$el, Backbone.$ '<div>']
      @el = @$el[0]
      @$el.html @$input

      return

    renderOptions: (options) ->
      html = @_getOptionsHtml options
      @$input.html html
      @$input.selectmenu @editorOptions
      @setValue @value
      return

    getValue: () -> @$input.val()

    setValue: (val) ->
      @$input.val val
      @$input.selectmenu 'refresh'
      return

    focus: () ->
      if @hasFocus then return
      @$input.selectmenu 'open'
      return

    blur: () ->
      if not @hasFocus then return
      @$input.selectmenu 'close'
      return

    change: () ->
      @trigger 'change', @
      return

  return
