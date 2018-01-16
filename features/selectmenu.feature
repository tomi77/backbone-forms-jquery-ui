Feature: "jqueryui.selectmenu" editor

  Scenario: Show form with editor
    Given Show "selectmenu" form
    Then I should see "bbf-jui-selectmenu" editor

  Scenario: "focus" event is fired when editor is accessed
    Given Show "selectmenu" form
    When Click on the "ui-selectmenu-button" editor
    Then "focus" event is fired

  Scenario: "blur" event is fired when editor is released
    Given Show "selectmenu" form
    When Click on the "ui-selectmenu-button" editor
    And Leaving the editor
    Then "blur" event is fired

  Scenario: "change" event is fired when new option is selected
    Given Show "selectmenu" form
    When Click on the "ui-selectmenu-button" editor
    And Select new speed
    Then Change event is fired and show "Medium"
