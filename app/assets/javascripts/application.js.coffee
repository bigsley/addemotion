#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require handlebars
#= require ember
#= require ember-data
#= require_self
#= require addemotion
#= require_tree .
#
# for more details see: http://emberjs.com/guides/application/
window.Addemotion = Ember.Application.create
  injectCredential: ->
    @register 'credential:current', Addemotion.CredentialObject,
      singleton: yes
    @inject 'controller', 'credential', 'credential:current'
    @inject 'route', 'credential', 'credential:current'

  ready: ->
    @injectCredential()

Addemotion.CredentialObject = Ember.Object.extend
  loggedIn: false
