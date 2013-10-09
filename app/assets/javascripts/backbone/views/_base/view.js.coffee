@SmallSteps.module 'Views', (Views, App, Backbone, Marionette, $, _) ->

  _.extend Marionette.View::,

    templateHelpers: ->
      type = @getGoalType()

      {
        isGoalYearly: ->
          type is App.GOALS_TYPES.YEARLY

        isGoalMonthly: ->
          type is App.GOALS_TYPES.MONTHLY

        isGoalWeekly: ->
          type is App.GOALS_TYPES.WEEKLY
      }


    getGoalType: ->
      goalType = ''
      url = window.location.pathname.split('/')
      rest = url.splice(0,2)

      if rest[1] == 'goals'
        switch url.length
          when 1 then goalType = 'yearly'
          when 2 then goalType = 'monthly'
          else goalType = 'weekly'
      else
        goalType = undefined

      goalType
