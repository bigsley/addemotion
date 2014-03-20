Addemotion.DashboardController = Ember.Controller.extend
  init: ->
  memories: Ember.computed.alias 'content'
  sortProperties: ['createdAt']
  sortAscending: false
  newMemory: Ember.computed ->
    Addemotion.Memory.createRecord()
  .property()
  mood: Ember.computed.alias 'newMemory.mood'
  stress: Ember.computed.alias 'newMemory.stress'
  isHappy: Ember.computed.equal 'newMemory.mood', 'happy'
  isSad: Ember.computed.equal 'newMemory.mood', 'sad'
  isStressed: Ember.computed.equal 'newMemory.stress', 'stressed'
  isChill: Ember.computed.equal 'newMemory.stress', 'chill'

  explanation: Ember.computed.alias 'newMemory.explanation'
  saveable: Ember.computed ->
    not (@get('mood')? and @get('stress')?)
  .property 'mood', 'stress'
  actions:
    happy: ->
      @set 'newMemory.mood', 'happy'

    sad: ->
      @set 'newMemory.mood', 'sad'

    stressed: ->
      @set 'newMemory.stress', 'stressed'

    chill: ->
      @set 'newMemory.stress', 'chill'

    saveMemory: ->
      @get('newMemory').save()
      @set 'newMemory', Addemotion.Memory.createRecord()
