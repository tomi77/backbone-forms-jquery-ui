seleniumWebdriver = require 'selenium-webdriver'
{defineSupportCode} = require 'cucumber'

Until = seleniumWebdriver.until
{By} = seleniumWebdriver

defineSupportCode ({When}) ->
  When 'Select new state', () ->
    @driver.findElement css: '.bbf-jui-autocomplete'
    .then (element) -> element.sendKeys 'ala'
    .then () => @driver.wait Until.elementLocated By.xpath "//div[contains(., 'Alaska')]"
    .then () => @driver.findElement xpath: "//div[contains(., 'Alaska')]/parent::li"
    .then (element) -> element.click()
