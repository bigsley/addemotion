Addemotion.IndexRoute = Ember.Route.extend
  beforeModel: ->
    unless @get('credential.loggedIn')
      return @transitionTo 'login'
    @transitionTo 'dashboard'
