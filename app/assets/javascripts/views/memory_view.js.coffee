# for more details see: http://emberjs.com/guides/views/

Addemotion.MemoryView = Ember.View.extend
  templateName: 'memory'
  mood: Ember.computed.alias('memory.mood')
  stress: Ember.computed.alias('memory.stress')
  explanation: Ember.computed.alias('memory.explanation')
  createdAt: Ember.computed ->
    moment(@get('memory.createdAt')).format('MMMM Do YYYY, h:mm:ss a');
  .property 'memory.createdAt'

