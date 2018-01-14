###
  Backbone-Forms jQuery UI datepicker editor 1.0.0

  Copyright (c) 2016 Tomasz Jakub Rup

  https://github.com/tomi77/backbone-forms-jquery-ui

  Released under the MIT license
###

((root, factory) ->
  ### istanbul ignore next ###
  switch
    when typeof define is 'function' and define.amd
      define ['underscore', 'backbone-forms', 'jquery-ui/widgets/datepicker'], factory
    when typeof exports is 'object'
      require('jquery-ui/widgets/datepicker')
      factory require('underscore'), require('backbone-forms')
    else
      factory root._, root.Backbone.Form
  return
) @, (_, Form) ->
  Form.editors['jqueryui.datepicker'] = Form.Editor.extend
    className: 'bbf-jui-datepicker'

    tagName: 'input'

    initialize: (options) ->
      Form.editors.Base::initialize.call @, options

      @editorOptions = @schema.editorOptions or {}

      prevOnSelect = @editorOptions.onSelect
      @editorOptions.onSelect = (dateText, inst) =>
        @trigger 'change', @, dateText, inst
        if prevOnSelect then prevOnSelect.call @el, dateText, inst
        return

      prevOnClose = @editorOptions.onClose
      @editorOptions.onClose = (dateText, inst) =>
        @trigger 'blur', @, dateText, inst
        if prevOnClose then prevOnClose.call @el, dateText, inst
        return

      prevBeforeShow = @editorOptions.beforeShow
      @editorOptions.beforeShow = (input, inst) =>
        @trigger 'focus', @, input, inst
        if prevBeforeShow then return prevBeforeShow.call @el, input, inst
        return {}

      @value = switch
        when @value and _.isDate @value then @value
        when @value and _.isString @value then new Date @value
        else
          new Date()

      @$el.attr 'type', 'text'
      return

    render: () ->
      @$el.datepicker @editorOptions
      @setValue @value
      @

    ###
    @return {Date}   Selected date
    ###
    getValue: () -> @$el.datepicker 'getDate'

    setValue: (value) ->
      @$el.datepicker 'setDate', value
      return

  return
