# for more details see: http://emberjs.com/guides/views/

Addemotion.MemoryView = Ember.View.extend
  templateName: 'memory'
  mood: Ember.computed.alias('memory.mood')
  stress: Ember.computed.alias('memory.stress')
  explanation: Ember.computed.alias('memory.explanation')
  explanationEmpty: Ember.computed ->
    return true unless @get('explanation')
    @get('explanation')?.trim().length is 0
  .property 'explanation'
  createdAt: Ember.computed ->
    moment(@get('memory.createdAt')).fromNow();
  .property 'memory.createdAt'

