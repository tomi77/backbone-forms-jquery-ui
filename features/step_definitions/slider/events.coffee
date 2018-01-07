seleniumWebdriver = require 'selenium-webdriver'
{defineSupportCode} = require 'cucumber'

Until = seleniumWebdriver.until
{By, Key} = seleniumWebdriver

defineSupportCode ({When, Then}) ->
  When 'Select new val', () ->
    @driver.actions().sendKeys([Key.ARROW_RIGHT]).perform()

  Then 'slider change event is fired', () -> @driver.wait Until.elementTextIs @driver.findElement(css: '.change .label'), '1'
