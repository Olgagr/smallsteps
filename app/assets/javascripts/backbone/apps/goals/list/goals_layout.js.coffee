SmallSteps.module 'GoalsApp.List', (List, App, Backbone, Marionette, $, _) ->

  List.GoalsLayout = App.Views.Layout.extend

    template: 'goals/list/templates/goals_layout'

    ui:
      subnav: '#goals-nav-region'

    regions:
      goalsNavRegion:     '#goals-nav-region'
      goalsContentRegion: '#goals-content-region'

    events:
      'click .sub-nav a': 'onLinkClicked'

    triggers:
      'click [data-add-goal="true"]': 'add:goal:clicked'

    onLinkClicked: (e) ->
      $target = $(e.currentTarget)
      @trigger 'goals:subnav:clicked', $target
      @triggerMethod('subnav:clicked', $target)
      e.preventDefault()

    onSubnavClicked: (link) ->
      @ui.subnav.find('.active').removeClass('active')
      link.closest('dd').addClass('active')

    templateHelpers:
      currentYear   : new Date().getFullYear()
      currentMonth  : new Date().getMonth() + 1
      currentWeek   : moment().week()
