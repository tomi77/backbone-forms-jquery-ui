Feature: "jqueryui.checkbox" editor

  Scenario: Show form with editor
    Given Show "checkbox" form
    Then I should see "bbf-jui-checkbox" editor

  Scenario: "focus" event is fired when editor is accessed
    Given Show "checkbox" form
    When Click on the "ui-checkboxradio-label" editor
    Then "focus" event is fired

  Scenario: "blur" event is fired when editor is released
    Given Show "checkbox" form
    When Click on the "ui-checkboxradio-label" editor
    And Leaving the editor
    Then "blur" event is fired

  Scenario: "change" event is fired when checkbox is clicked
    Given Show "checkbox" form
    When Click on the "ui-checkboxradio-label" editor
    Then Change event is fired and show "true"
    When Click on the "ui-checkboxradio-label" editor
    Then Change event is fired and show "false"
