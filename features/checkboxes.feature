Feature: Test "jqueryui.checkboxes" editor

  Scenario: Show form with editor
    Given Show "checkboxes" form
    Then I should see "bbf-jui-checkboxes" editor

  Scenario: "focus" event
    Given Show "checkboxes" form
    When Click on the "ui-checkboxradio-label" editor
    Then "focus" event is fired

  Scenario: "blur" event
    Given Show "checkboxes" form
    When Click on the "ui-checkboxradio-label" editor
    And Leaving the editor
    Then "blur" event is fired

  Scenario: "change" event
    Given Show "checkboxes" form
    When Click on the "ui-checkboxradio-label" editor
    Then Change event is fired and show "1"
    When Click on the "ui-checkboxradio-label" editor
    Then Change event is fired and show ""
