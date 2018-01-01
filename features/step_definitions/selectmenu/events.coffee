seleniumWebdriver = require 'selenium-webdriver'
{defineSupportCode} = require 'cucumber'

Until = seleniumWebdriver.until
{By, WebElementCondition, Condition} = seleniumWebdriver

defineSupportCode ({When, Then}) ->
  When 'Select new speed', () ->
    @driver.findElement css: '.ui-selectmenu-button'
    .then (element) -> element.click()
    .then () => @driver.findElement xpath: "//li[contains(., 'Medium')]"
    .then (element) -> element.click()

  Then 'selectmenu change event is fired', () ->
    condition = new Condition '', (driver) ->
      driver.findElement css: '.change .label'
      .then (element) -> element.getText()
      .then (text) -> text is 'Medium'
    @driver.wait(condition)
