define (require) ->
  
  class Student extends Backbone.Model

    thresholds:
      progress:    [ -20, -5,  2 ]
      mastery:     [ 60 , 70, 80 ]
      attendance:  [ 70 , 80, 90 ]
      achievement: [ 60 , 70, 80 ]
      compliance:  [ 70 , 80, 90 ]

    levelOf: (attribute) ->
      thresholds = @thresholds[attribute]
      value = @get(attribute)
      if value < thresholds[0]
        'at-risk'
      else if value < thresholds[1]
        'approaching-risk'
      else if value < thresholds[2]
        'below-average'
      else
        'thriving'

