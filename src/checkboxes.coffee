###
  Backbone-Forms jQuery UI checkboxes editor 1.0.0

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
  Form.editors['jqueryui.checkboxes'] = Form.editors.Checkboxes.extend
    className: 'bbf-jui-checkboxes'

    initialize: (options) ->
      Form.editors.Checkboxes::initialize.call @, options

      @editorOptions = @schema.editorOptions or {}

      return

    renderOptions: (options) ->
      Form.editors.Checkboxes::renderOptions.call @, options
      @$('input[type=checkbox]').checkboxradio @editorOptions
      return

  return
