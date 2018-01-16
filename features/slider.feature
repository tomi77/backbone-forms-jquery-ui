Feature: "jqueryui.slider" editor

  Scenario: Show form with editor
    Given Show "slider" form
    Then I should see "bbf-jui-slider" editor

  Scenario: "focus" event is fired when editor is accessed
    Given Show "slider" form
    When Start dragging "ui-slider-handle" element
    Then "focus" event is fired

  Scenario: "blur" event is fired when editor is released
    Given Show "slider" form
    When Start dragging "ui-slider-handle" element
    And Stop dragging "ui-slider-handle" element
    Then "blur" event is fired

  Scenario: "change" event is fired when slider is moved
    Given Show "slider" form
    When Click on the "ui-slider-handle" editor
    And Select new val
    Then Change event is fired and show "1"
