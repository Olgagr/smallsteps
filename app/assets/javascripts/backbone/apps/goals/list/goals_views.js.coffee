SmallSteps.module 'GoalsApp.List', (List, App, Backbone, Marionette, $, _) ->

  List.GoalItem = App.Views.ItemView.extend

    template: 'goals/list/templates/goal_item'

    tagName: 'li'


  List.GoalsList = App.Views.CollectionView.extend

    itemView: List.GoalItem

    tagName: 'ul'

