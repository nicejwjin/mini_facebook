this.User = new Mongo.Collection 'user'
this.Board = new Mongo.Collection 'board'
this.Comment = new Mongo.Collection 'comment'

cl = console.log

User.allow
  insert: (userId, doc, fields, modifier) ->
    user = User.findOne 이메일: doc.이메일
    if user? then false else true

Board.allow
  insert: (userId, doc, fields, modifier) ->
    return true

Comment.allow
  insert: (userId, doc, fields, modifier) ->
    return true