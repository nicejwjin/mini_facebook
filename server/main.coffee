HTTP.methods
  '/board':
    'get': ->
      return Board.find().fetch()

