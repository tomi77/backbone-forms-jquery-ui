###
  Backbone-Forms jQuery UI autocomplete editor 0.1.0

  Copyright (c) 2016 Tomasz Jakub Rup

  https://github.com/tomi77/backbone-forms-jquery-ui

  Released under the MIT license
###

((root, factory) ->
  ### istanbul ignore next ###
  switch
    when typeof define is 'function' and define.amd
      define ['underscore', 'backbone', 'backbone-forms', 'jquery-ui/widgets/autocomplete'], factory
    when typeof exports is 'object'
      require('jquery-ui/widgets/autocomplete')
      factory require('underscore'), require('backbone'), require('backbone-forms')
    else
      factory root._, root.Backbone, root.Backbone.Form
  return
) @, (_, Backbone, Form) ->
  Form.editors['jqueryui.autocomplete'] = Form.editors.Text.extend
    className: 'bbf-jui-autocomplete'

    events:
      change: 'determineChange'
      focus: () ->
        @trigger 'focus', @
        return
      blur: () ->
        @trigger 'blur', @
        return
      autocompleteselect: () ->
        setTimeout () =>
          @determineChange()
          return
        , 0
        return

    initialize: (options) ->
      Form.editors.Text::initialize.call @, options

      @editorOptions = @schema.editorOptions or {}
      @editorOptions.source = @schema.options or []

      if @editorOptions.source instanceof Backbone.Collection
        @editorOptions.source = @editorOptions.source.map (model) -> model.toString()

      return

    render: () ->
      @$el.autocomplete @editorOptions
      Form.editors.Text::render.call @

  return
