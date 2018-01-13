seleniumWebdriver = require 'selenium-webdriver'
{defineSupportCode} = require 'cucumber'

Until = seleniumWebdriver.until
{By, WebElementCondition, Condition} = seleniumWebdriver

defineSupportCode ({When, Then}) ->
  When 'Click on the {string} editor', (cssSelector) ->
    @driver.findElement By.className cssSelector
    .then (element) -> element.click()

  When 'Start dragging {string} element', (cssSelector) ->
    @driver.findElement By.className cssSelector
    .then (element) => @driver.actions().mouseDown(element).perform()

  When 'Stop dragging {string} element', (cssSelector) ->
    @driver.findElement By.className cssSelector
    .then (element) => @driver.actions().mouseUp(element).perform()

  Then '{string} event is fired', (type) ->
    condition = new WebElementCondition '', (driver) ->
      driver.findElement By.className type
      .then (element) -> element.isDisplayed().then (v) -> if v then element else null
    @driver.wait(condition)

  When 'Leaving the editor', () ->
    @driver.findElement css: 'body'
    .then (element) -> element.click()

  Then 'Change event is fired and show {string}', (new_val) -> @driver.wait Until.elementTextIs @driver.findElement(css: '.change .label'), new_val
