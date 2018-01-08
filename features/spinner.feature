Feature: Test "jqueryui.spinner" editor

  Scenario: Show form with editor
    Given Show "spinner" form
    Then I should see "bbf-jui-spinner" editor

  Scenario: "focus" event
    Given Show "spinner" form
    When Click on the "ui-spinner-input" editor
    Then Focus event is fired

  Scenario: "blur" event
    Given Show "spinner" form
    When Click on the "ui-spinner-input" editor
    And Leaving the editor
    Then Blur event is fired

  Scenario: "change" event
    Given Show "spinner" form
    When Click on the "ui-spinner-up" editor
    Then spinner change event is fired
