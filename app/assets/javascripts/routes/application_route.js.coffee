Addemotion.ApplicationRoute = Ember.Route.extend
  beforeModel: ->
    @transitionTo 'things'
