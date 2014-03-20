Addemotion.ThingsRoute = Ember.Route.extend
  model: -> 
    Addemotion.Thing.find()
