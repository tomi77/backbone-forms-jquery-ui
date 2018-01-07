seleniumWebdriver = require 'selenium-webdriver'
{defineSupportCode} = require 'cucumber'

Until = seleniumWebdriver.until
{By, WebElementCondition, Condition} = seleniumWebdriver

defineSupportCode ({When, Then}) ->
  When 'Click on the {string} editor', (cssSelector) ->
    @driver.findElement css: ".#{cssSelector}"
    .then (element) -> element.click()

  When 'Start dragging {string} element', (cssSelector) ->
    @driver.findElement css: ".#{cssSelector}"
    .then (element) => @driver.actions().mouseDown(element).perform()

  When 'Stop dragging {string} element', (cssSelector) ->
    @driver.findElement css: ".#{cssSelector}"
    .then (element) => @driver.actions().mouseUp(element).perform()

  Then 'Focus event is fired', () ->
    condition = new WebElementCondition '', (driver) ->
      driver.findElement css: '.blur'
      .then (element) -> element.isDisplayed().then (v) -> if v then null else element
    @driver.wait(condition)

  When 'Leaving the editor', () ->
    @driver.findElement css: 'body'
    .then (element) -> element.click()

  Then 'Blur event is fired', () ->
    condition = new WebElementCondition '', (driver) ->
      driver.findElements css: '.focus'
      .then (elements) -> elements[0]
      .then (element) -> element.isDisplayed().then (v) -> if v then null else element
    @driver.wait(condition)
