seleniumWebdriver = require 'selenium-webdriver'
{defineSupportCode} = require 'cucumber'

Until = seleniumWebdriver.until
{By, WebElementCondition, Condition} = seleniumWebdriver

forChangeEvent = new Condition '', (driver) ->
  driver.findElement css: '.change .label'
  .then (element) -> element.getText()
  .then (text) -> text is 'Medium'

defineSupportCode ({When, Then}) ->
  When 'Select new speed', () ->
    @driver.wait Until.elementLocated By.xpath "//div[contains(., 'Medium')]"
    .then () => @driver.findElement xpath: "//div[contains(., 'Medium')]/parent::li"
    .then (element) -> element.click()

  Then 'selectmenu change event is fired', () -> @driver.wait forChangeEvent
