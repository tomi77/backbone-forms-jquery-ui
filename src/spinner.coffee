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
    tagName: 'input'

    className: 'bbf-jui-spinner'

    initialize: (options) ->
      Form.editors.Text::initialize.call @, options

      @editorOptions = @schema.editorOptions or {}

      return

    render: () ->
      f = () => @$el.spinner @editorOptions or {}
      _.delay f, @schema.delay or 100
      Form.editors.Text::render.call @

  return
