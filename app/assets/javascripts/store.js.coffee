# http://emberjs.com/guides/models/using-the-store/

Addemotion.Store = DS.Store.extend
  adapter: DS.RESTAdapter.create()
