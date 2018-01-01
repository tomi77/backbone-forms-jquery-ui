seleniumWebdriver = require 'selenium-webdriver'
{defineSupportCode} = require 'cucumber'

Until = seleniumWebdriver.until

defineSupportCode ({Given}) ->
  Given 'Show {string} form', (menu) ->
    @driver.get "https://tomi77.github.io/backbone-forms-jquery-ui/#{menu}.html"
    @driver.findElement css: '.container'
    .then Until.elementIsVisible.bind(Until)
    .then @driver.wait.bind(@driver)
