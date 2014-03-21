Addemotion.ApplicationRoute = Ember.Route.extend
  beforeModel: ->
    $.ajax
      url: "/sessions"
      dataType: 'json'
      success: (data) =>
        @set('credential.loggedIn', data['loggedIn'])
