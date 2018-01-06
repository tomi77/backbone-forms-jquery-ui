seleniumWebdriver = require 'selenium-webdriver'
{defineSupportCode} = require 'cucumber'

Until = seleniumWebdriver.until
{By, Key, promise} = seleniumWebdriver

defineSupportCode ({When, Then}) ->
  When 'Show the "bbf-jui-datepicker" editor', () ->
    @driver.executeScript "$('.bbf-jui-datepicker').datepicker('show')"
    .then () => @driver.findElement css: '#ui-datepicker-div'
    .then (element) => @driver.wait Until.elementIsVisible element
    .then () => @driver.sleep 500

  When 'Select new date', () ->
    # @driver.findElement By.partialLinkText '6'
    @driver.findElements css: '#ui-datepicker-div td[data-handler=selectDay] a'
    .then (elements) ->
      console.log elements[5]
      elements[5]
    .then (element) -> element.click()

  Then 'datepicker change event is fired', () -> @driver.wait Until.elementTextIs @driver.findElement(css: '.change .label'), '2018-01-06'
