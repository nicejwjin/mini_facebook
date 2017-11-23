HTTP.methods
  '/board':
    'get': ->
      return Board.find().fetch()
    'post': (data) ->
      return JSON.parse data
    'put': (data) ->
      return JSON.parse data
    'delete': (data) ->
      return JSON.parse data

  '/query': ->
    return this.query

  '/param/:param1': ->
    return this.params.param1



Meteor.methods
  'getBoard': (data) ->
    return Board.find().fetch()


