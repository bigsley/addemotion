Addemotion.AppRoute = Ember.Route.extend
  beforeModel: ->
    unless @get('credential.loggedIn')
      @transitionTo 'login'
