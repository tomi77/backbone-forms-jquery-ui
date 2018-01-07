Feature: Test "jqueryui.slider" editor

  Scenario: Show form with editor
    Given Show "slider" form
    Then I should see "bbf-jui-slider" editor

  Scenario: "focus" event
    Given Show "slider" form
    When Start dragging "ui-slider-handle" element
    Then Focus event is fired

  Scenario: "blur" event
    Given Show "slider" form
    When Start dragging "ui-slider-handle" element
    And Stop dragging "ui-slider-handle" element
    Then Blur event is fired

  Scenario: "change" event
    Given Show "slider" form
    When Click on the "ui-slider-handle" editor
    And Select new val
    Then slider change event is fired
