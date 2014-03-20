# for more details see: http://emberjs.com/guides/models/defining-models/

Addemotion.Memory = DS.Model.extend
  mood: DS.attr 'string'
  stress: DS.attr 'string'
  explanation: DS.attr 'string'
  createdAt: DS.attr 'date'
