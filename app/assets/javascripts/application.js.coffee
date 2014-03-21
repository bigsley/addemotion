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

    @register 'groupData:current', Addemotion.GroupDataObject,
      singleton: yes
    @inject 'controller', 'groupData', 'groupData:current'
    @inject 'route', 'groupData', 'groupData:current'


  ready: ->
    @injectCredential()

Addemotion.CredentialObject = Ember.Object.extend
  loggedIn: false

Addemotion.GroupDataObject = Ember.Object.extend
  numberUsers: null
  activeToday: null
  numberHappy: null
  numberSad: null
  numberStressed: null
  numberChill: null
