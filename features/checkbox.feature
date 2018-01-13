Feature: Test "jqueryui.checkbox" editor

  Scenario: Show form with editor
    Given Show "checkbox" form
    Then I should see "bbf-jui-checkbox" editor

  Scenario: "focus" event
    Given Show "checkbox" form
    When Click on the "ui-checkboxradio-label" editor
    Then "focus" event is fired

  Scenario: "blur" event
    Given Show "checkbox" form
    When Click on the "ui-checkboxradio-label" editor
    And Leaving the editor
    Then "blur" event is fired

  Scenario: "change" event
    Given Show "checkbox" form
    When Click on the "ui-checkboxradio-label" editor
    Then Change event is fired and show "true"
    When Click on the "ui-checkboxradio-label" editor
    Then Change event is fired and show "false"
