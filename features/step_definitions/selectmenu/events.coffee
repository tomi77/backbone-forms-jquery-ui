seleniumWebdriver = require 'selenium-webdriver'
{defineSupportCode} = require 'cucumber'

Until = seleniumWebdriver.until
{By} = seleniumWebdriver

defineSupportCode ({When}) ->
  When 'Select new speed', () ->
    @driver.wait Until.elementLocated By.xpath "//div[contains(., 'Medium')]"
    .then () => @driver.findElement xpath: "//div[contains(., 'Medium')]/parent::li"
    .then (element) -> element.click()
