Addemotion.DashboardRoute = Ember.Route.extend
  model: -> 
    $.ajax
      url: 'my_data'
      dataType: 'json'
      success: (data) =>
        @get('myData').setProperties(data)
    Addemotion.Memory.find()
