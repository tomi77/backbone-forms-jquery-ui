seleniumWebdriver = require 'selenium-webdriver'
{defineSupportCode} = require 'cucumber'

Until = seleniumWebdriver.until
{By, Key} = seleniumWebdriver

defineSupportCode ({When, Then}) ->
  Then 'spinner change event is fired', () -> @driver.wait Until.elementTextIs @driver.findElement(css: '.change .label'), '1'
