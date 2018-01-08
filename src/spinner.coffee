###
  Backbone-Forms jQuery UI spinner editor 0.1.0

  Copyright (c) 2016 Tomasz Jakub Rup

  https://github.com/tomi77/backbone-forms-jquery-ui

  Released under the MIT license
###

((root, factory) ->
  ### istanbul ignore next ###
  switch
    when typeof define is 'function' and define.amd
      define ['underscore', 'backbone', 'backbone-forms', 'jquery-ui/widgets/spinner'], factory
    when typeof exports is 'object'
      require('jquery-ui/widgets/spinner')
      factory require('underscore'), require('backbone'), require('backbone-forms')
    else
      factory root._, root.Backbone, root.Backbone.Form
  return
) @, (_, Backbone, Form) ->
  Form.editors['jqueryui.spinner'] = Form.editors.Text.extend
    className: 'bbf-jui-spinner'

    events:
      focus: (event) ->
        @trigger 'focus', @
        return
      blur: (event) ->
        @trigger 'blur', @
        return
      spinstop: () ->
        @trigger 'change', @
        return

    initialize: (options) ->
      Form.editors.Text::initialize.call @, options

      @editorOptions = @schema.editorOptions or {}

      [@$spinner, @$el] = [@$el, Backbone.$ '<div>']
      @el = @$el[0]
      @$el.html @$spinner

      return

    render: () ->
      @$spinner.spinner @editorOptions
      return Form.editors.Text::render.call @

    determineChange: (event) ->
      currentValue = @$spinner.val()
      changed = currentValue isnt @previousValue

      if changed
        @previousValue = currentValue

        @trigger 'change', @
      return

    getValue: () -> @$spinner.val()

    setValue: (val) ->
      @$spinner.val val
      return

    focus: () ->
      if @hasFocus then return

      @$spinner.focus()
      return

    blur: () ->
      if not @hasFocus then return

      @$spinner.blur()
      return

    select: () ->
      @$spinner.select()
      return

  return
