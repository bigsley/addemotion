Addemotion.DashboardRoute = Ember.Route.extend
  model: -> 
    Addemotion.Memory.find()
