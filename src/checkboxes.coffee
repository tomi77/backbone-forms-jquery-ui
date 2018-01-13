###
  Backbone-Forms jQuery UI checkboxes editor 0.1.0

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

    renderOptions: (options) ->
      f = () =>
        @$('input[type=checkbox]').checkboxradio @schema.editorOptions or {}
        return
      _.delay f, @schema.delay or 100
      Form.editors.Checkboxes::renderOptions.call @, options

  return
