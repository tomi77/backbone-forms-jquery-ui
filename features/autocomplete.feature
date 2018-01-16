Feature: "jqueryui.autocomplete" editor

  Scenario: Show form with editor
    Given Show "autocomplete" form
    Then I should see "bbf-jui-autocomplete" editor

  Scenario: "focus" event is fired when editor is accessed
    Given Show "autocomplete" form
    When Click on the "bbf-jui-autocomplete" editor
    Then "focus" event is fired

  Scenario: "blur" event is fired when editor is released
    Given Show "autocomplete" form
    When Click on the "bbf-jui-autocomplete" editor
    And Leaving the editor
    Then "blur" event is fired

  Scenario: "change" event is fired when content is changed
    Given Show "autocomplete" form
    When Click on the "bbf-jui-autocomplete" editor
    And Select new state
    Then Change event is fired and show "Alaska"
