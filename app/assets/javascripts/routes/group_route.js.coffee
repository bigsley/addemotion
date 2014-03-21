Addemotion.GroupRoute = Ember.Route.extend
  model: -> 
    $.ajax
      url: 'group_data'
      dataType: 'json'
      success: (data) =>
        @get('groupData').setProperties(data) 
