Feature: Test "jqueryui.datepicker" editor

  Scenario: Show form with editor
    Given Show "datepicker" form
    Then I should see "bbf-jui-datepicker" editor

  Scenario: "focus" event
    Given Show "datepicker" form
    When Click on the "bbf-jui-datepicker" editor
    Then Focus event is fired

  Scenario: "blur" event
    Given Show "datepicker" form
    When Click on the "bbf-jui-datepicker" editor
    And Leaving the editor
    Then Blur event is fired

  @ignore
  Scenario: "change" event
    Given Show "datepicker" form
    When Show the "bbf-jui-datepicker" editor
    And Select new date
    Then Change event is fired and show "2018-01-06"
