Feature: "jqueryui.checkboxes" editor

  Scenario: Show form with editor
    Given Show "checkboxes" form
    Then I should see "bbf-jui-checkboxes" editor

  Scenario: "focus" event is fired when editor is accessed
    Given Show "checkboxes" form
    When Click on the "ui-checkboxradio-label" editor
    Then "focus" event is fired

  Scenario: "blur" event is fired when editor is released
    Given Show "checkboxes" form
    When Click on the "ui-checkboxradio-label" editor
    And Leaving the editor
    Then "blur" event is fired

  Scenario: "change" event is fired when checkbox is clicked
    Given Show "checkboxes" form
    When Click on the "ui-checkboxradio-label" editor
    Then Change event is fired and show "1"
    When Click on the "ui-checkboxradio-label" editor
    Then Change event is fired and show ""
