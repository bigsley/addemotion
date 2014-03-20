Addemotion.AnalysisRoute = Ember.Route.extend
  model: -> 
    Addemotion.Memory.find()
