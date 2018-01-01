Feature: Test "jqueryui.selectmenu" editor

  Scenario: Show form with editor
    Given Show "selectmenu" form
    Then I should see "bbf-jui-selectmenu" editor

  Scenario: Events
    Given Show "selectmenu" form
    When Click on the "ui-selectmenu-button" editor
    Then Focus event is fired
    When Leaving the editor
    Then Blur event is fired
    When Select new speed
    Then selectmenu change event is fired
