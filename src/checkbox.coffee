###
  Backbone-Forms jQuery UI checkbox editor 0.1.0

  Copyright (c) 2016 Tomasz Jakub Rup

  https://github.com/tomi77/backbone-forms-jquery-ui

  Released under the MIT license
###

((root, factory) ->
  ### istanbul ignore next ###
  switch
    when typeof define is 'function' and define.amd
      define ['backbone-forms', 'jquery-ui/widgets/checkboxradio'], factory
    when typeof exports is 'object'
      require('jquery-ui/widgets/checkboxradio')
      factory require('backbone-forms')
    else
      factory root.Backbone.Form
  return
) @, (Form) ->
  Form.editors['jqueryui.checkbox'] = Form.editors.Checkbox.extend
    className: 'bbf-jui-checkbox'

    initialize: (options) ->
      Form.editors.Checkbox::initialize.call @, options

      @editorOptions = @schema.editorOptions or {}

      [@$input, @$el, $label] = [@$el, Backbone.$('<div>'), Backbone.$("<label for='#{ @id }'>")]
      @el = @$el[0]
      $label.html('&nbsp;')
      @$el.html @$input
      @$el.append $label

      return

    render: () ->
      @$input.checkboxradio @editorOptions
      Form.editors.Checkbox::render.call @

    getValue: () ->
      @$input.prop('checked')

    setValue: (value) ->
      @$input.prop('checked', value is true)
      return

    focus: () ->
      if @hasFocus then return

      @$input.focus()
      return

    blur: () ->
      if not @hasFocus then return

      @$input.blur()
      return

  return
