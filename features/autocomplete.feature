Feature: Test "jqueryui.autocomplete" editor

  Scenario: Show form with editor
    Given Show "autocomplete" form
    Then I should see "bbf-jui-autocomplete" editor

  Scenario: "focus" event
    Given Show "autocomplete" form
    When Click on the "bbf-jui-autocomplete" editor
    Then Focus event is fired

  Scenario: "blur" event
    Given Show "autocomplete" form
    When Click on the "bbf-jui-autocomplete" editor
    And Leaving the editor
    Then Blur event is fired

  Scenario: "change" event
    Given Show "autocomplete" form
    When Click on the "bbf-jui-autocomplete" editor
    And Select new state
    Then Change event is fired and show "Alaska"
