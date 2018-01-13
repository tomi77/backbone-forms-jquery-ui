Feature: Test "jqueryui.spinner" editor

  Scenario: Show form with editor
    Given Show "spinner" form
    Then I should see "bbf-jui-spinner" editor

  Scenario: "focus" event
    Given Show "spinner" form
    When Click on the "ui-spinner-input" editor
    Then "focus" event is fired

  Scenario: "blur" event
    Given Show "spinner" form
    When Click on the "ui-spinner-input" editor
    And Leaving the editor
    Then "blur" event is fired

  Scenario: "change" event
    Given Show "spinner" form
    When Click on the "ui-spinner-up" editor
    Then Change event is fired and show "1"
