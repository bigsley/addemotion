# http://emberjs.com/guides/models/using-the-store/

DS.RESTAdapter.configure("plurals", { memory: "memories" });

Addemotion.Store = DS.Store.extend
  adapter: DS.RESTAdapter.create()
