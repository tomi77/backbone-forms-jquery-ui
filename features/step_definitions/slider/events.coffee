seleniumWebdriver = require 'selenium-webdriver'
{defineSupportCode} = require 'cucumber'

{Key} = seleniumWebdriver

defineSupportCode ({When}) ->
  When 'Select new val', () ->
    @driver.actions().sendKeys([Key.ARROW_RIGHT]).perform()
