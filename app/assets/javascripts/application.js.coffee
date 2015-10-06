#= require jquery
#= require jquery_ujs
#= require bootstrap
#= require react
#= require react_ujs
#= require select2
#= require tags
#= require components
#= require teams
#= require particles
#= require smoothscroll

if $('#particles-js').length
  particlesJS.load 'particles-js', 'particles-config.json', ->
    console.log('callback - particles.js config loaded')
