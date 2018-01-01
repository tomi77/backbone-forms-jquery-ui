Feature: Test "jqueryui.autocomplete" editor

  Scenario: Show form with editor
    Given Show "autocomplete" form
    Then I should see "bbf-jui-autocomplete" editor

  Scenario: Events
    Given Show "autocomplete" form
    When Click on the "bbf-jui-autocomplete" editor
    Then Focus event is fired
    When Leaving the editor
    Then Blur event is fired
    When Select new state
    Then autocomplete change event is fired
