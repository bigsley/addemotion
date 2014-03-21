Addemotion.ApplicationController = Ember.Controller.extend
  actions: 
    logout: ->
      $.ajax
        dataType: 'json'
        url: '/sessions'
        method: 'DELETE'
        success: (data) =>
          @set('credential.loggedIn', false)
          window.location.reload()
        error: (data) ->
          console.log(data)
