Addemotion.AnalysisController = Ember.ArrayController.extend Ember.SortableMixin,
  memories: Ember.computed.alias 'content'
  sortProperties: ['createdAt']
  sortAscending: false
