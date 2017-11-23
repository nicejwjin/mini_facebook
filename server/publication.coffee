Meteor.publish 'users', ->
  return User.find()

Meteor.publish 'boards', ->
  return Board.find({}, {sort: {작성시간: -1}, limit: 5})

Meteor.publish 'comments', ->
  return Comment.find()

Meteor.publish 'mainPage', ->
  return [
    User.find()
    Board.find({}, {sort: {작성시간: -1}, limit: 5})
    Comment.find()
  ]