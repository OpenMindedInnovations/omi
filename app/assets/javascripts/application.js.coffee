#= require jquery
#= require jquery_ujs
#= require bootstrap
#= require react
#= require react_ujs
#= require components
#= require particles

if $('#particles-js').length
  particlesJS.load 'particles-js', 'particles-config.json', ->
    console.log('callback - particles.js config loaded')

# particlesJS.load 'landing-header', 'particles-config.json', ->
#   console.log('callback - particles.js config loaded')
