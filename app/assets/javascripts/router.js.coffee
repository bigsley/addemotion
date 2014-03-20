# For more information see: http://emberjs.com/guides/routing/

Addemotion.Router.map () ->
  @route 'login', path: '/login'
  @resource 'app', ->
    @resource 'dashboard', {path: '/dashboard'}
    @resource 'analysis', {path: '/analysis'}

