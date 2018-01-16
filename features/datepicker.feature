Feature: "jqueryui.datepicker" editor

  Scenario: Show form with editor
    Given Show "datepicker" form
    Then I should see "bbf-jui-datepicker" editor

  Scenario: "focus" event is fired when editor is accessed
    Given Show "datepicker" form
    When Click on the "bbf-jui-datepicker" editor
    Then "focus" event is fired

  Scenario: "blur" event is fired when editor is released
    Given Show "datepicker" form
    When Click on the "bbf-jui-datepicker" editor
    And Leaving the editor
    Then "blur" event is fired

  @ignore
  Scenario: "change" event is fired when date is clicked
    Given Show "datepicker" form
    When Show the "bbf-jui-datepicker" editor
    And Select new date
    Then Change event is fired and show "2018-01-06"
