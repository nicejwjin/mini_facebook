Meteor.publish 'users', ->
  return Meteor.users.find()

Meteor.publish 'boards', ->
  return Board.find({}, {sort: {작성시간: -1}, limit: 5})

Meteor.publish 'comments', ->
  return Comment.find()

Meteor.publish 'mainPage', ->
  return [
    Meteor.users.find({}, {fields: username: 1})
    Board.find({}, {sort: {작성시간: -1}, limit: 5})
    Comment.find()
  ]