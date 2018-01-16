Feature: "jqueryui.radio" editor

  Scenario: Show form with editor
    Given Show "radio" form
    Then I should see "bbf-jui-radio" editor

  Scenario: "focus" event is fired when editor is accessed
    Given Show "radio" form
    When Click on the "ui-checkboxradio-label" editor
    Then "focus" event is fired

  Scenario: "blur" event is fired when editor is released
    Given Show "radio" form
    When Click on the "ui-checkboxradio-label" editor
    And Leaving the editor
    Then "blur" event is fired

  Scenario: "change" event is fired when radio is clicked
    Given Show "radio" form
    When Click on the "ui-checkboxradio-label" editor
    Then Change event is fired and show "1"
