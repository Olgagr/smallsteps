SmallSteps.module 'GoalsApp.List', (List, App, Backbone, Marionette, $, _) ->

  List.GoalItem = App.Views.ItemView.extend

    template: 'goals/list/templates/goal_item'

    tagName: 'li'

    className: -> 'finished' if @model.get('finished')

    triggers:
      'click [data-action="edit"]'      : 'edit:goal:clicked'
      'click [data-action="delete"]'    : 'delete:goal:clicked'

    events:
      'click [data-action="finished"]'  : 'onClickFinished'

    modelEvents: ->
      'change': -> @render()

    onClickFinished: ->
      @trigger 'finished:goal:clicked', @model
      @renderFinishedState()

    renderFinishedState: ->
      @$el.toggleClass('finished')
      @$('button').prop('disabled', true)
      @render()

  List.NoItems = App.Views.ItemView.extend

    template: 'goals/list/templates/goals_no_items'


  List.GoalsList = App.Views.CollectionView.extend

    itemView: List.GoalItem

    tagName: 'ul'

    className: 'goals-items'

    emptyView: List.NoItems

    initialize: ->
      @listenTo @, 'itemview:edit:goal:clicked', (view, obj) =>
        @trigger 'edit:goal:clicked',
          model: obj.model
          collection: @collection

