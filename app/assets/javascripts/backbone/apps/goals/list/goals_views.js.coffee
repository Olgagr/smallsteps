SmallSteps.module 'GoalsApp.List', (List, App, Backbone, Marionette, $, _) ->

  List.GoalItem = App.Views.ItemView.extend

    template: 'goals/list/templates/goal_item'

    tagName: 'li'

    triggers:
      'click [data-action="edit"]':   'edit:goal:clicked'
      'click [data-action="delete"]': 'delete:goal:clicked'

    modelEvents: ->
      'change': -> @render()


  List.GoalsList = App.Views.CollectionView.extend

    itemView: List.GoalItem

    tagName: 'ul'

    initialize: ->
      @listenTo @, 'itemview:edit:goal:clicked', (view, obj) =>
        @trigger 'edit:goal:clicked',
          model: obj.model
          collection: @collection

