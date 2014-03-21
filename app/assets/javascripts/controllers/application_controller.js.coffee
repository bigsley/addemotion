Addemotion.ApplicationController = Ember.Controlller.extend
  actions: 
    logout: ->
      $.ajax
        dataType: 'json'
        url: '/sessions'
        method: 'DELETE'
        success: (data) =>
          @set('credential.loggedIn', false)
          @transitionToRoute('login')
        error: (data) ->
          console.log(data)
