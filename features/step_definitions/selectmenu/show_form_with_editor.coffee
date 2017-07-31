seleniumWebdriver = require 'selenium-webdriver'
{defineSupportCode} = require 'cucumber'

Until = seleniumWebdriver.until

defineSupportCode ({Then}) ->
  Then 'I should see selectmenu editor', () ->
    condition = Until.elementLocated css: '.bbf-jui-selectmenu'
    @driver.wait(condition)
