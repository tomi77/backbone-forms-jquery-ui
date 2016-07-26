###
  Backbone-Forms jQuery UI slider editor 0.1.0

  Copyright (c) 2016 Tomasz Jakub Rup

  https://github.com/tomi77/backbone-forms-jquery-ui

  Released under the MIT license
###

((root, factory) ->
  ### istanbul ignore next ###
  switch
    when typeof define is 'function' and define.amd
      define ['backbone-forms', 'jquery-ui/widgets/slider'], factory
    when typeof exports is 'object'
      require('jquery-ui/widgets/slider')
      factory require('backbone-forms')
    else
      factory root.Backbone.Form
  return
) @, (Form) ->
  Form.editors['jqueryui.slider'] = Form.Editor.extend
    className: 'bbf-jui-slider'

    initialize: (options) ->
      Form.editors.Base::initialize.call @, options

      @editorOptions = @schema.editorOptions or {}

      return

    render: () ->
      @$el.slider @editorOptions
      @setValue @value
      @

    getValue: () -> @$el.slider 'option', 'value'

    setValue: (value) ->
      @$el.datepicker 'option', 'value', value
      return

#    focus: () ->
#      unless @hasFocus then @trigger 'focus', @
#      return
#
#    blur: () ->
#      if @hasFocus then @trigger 'blur', @
#      return

  return
