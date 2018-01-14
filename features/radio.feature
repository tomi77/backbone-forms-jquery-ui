Feature: Test "jqueryui.radio" editor

  Scenario: Show form with editor
    Given Show "radio" form
    Then I should see "bbf-jui-radio" editor

  Scenario: "focus" event
    Given Show "radio" form
    When Click on the "ui-checkboxradio-label" editor
    Then "focus" event is fired

  Scenario: "blur" event
    Given Show "radio" form
    When Click on the "ui-checkboxradio-label" editor
    And Leaving the editor
    Then "blur" event is fired

  Scenario: "change" event
    Given Show "radio" form
    When Click on the "ui-checkboxradio-label" editor
    Then Change event is fired and show "1"
