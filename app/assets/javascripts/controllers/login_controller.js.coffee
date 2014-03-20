Addemotion.LoginController = Ember.Controller.extend
  email: null
  password: null
  actions: 
    submit: ->
      email = @get('email')
      password = @get('password')
      @set('email', null)
      @set('password', null)
      $.ajax
        dataType: 'json'
        url: '/sessions'
        method: 'POST'
        data:
          email: email
          password: password
        success: (data) ->
          @set('credential.loggedIn', true)
        error: (data) ->
          console.log(data)
