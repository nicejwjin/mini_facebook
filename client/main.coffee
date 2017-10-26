cl = console.log
Template.body.helpers
  로그인상태: -> if SessionStore.get('사용자키')? then true else false
  글목록: -> Board.find()

Template.body.events
  'click #작성': (evt, tmpl) ->
    Board.insert
      작성자정보: User.findOne _id: SessionStore.get '사용자키'
      제목: $('#제목').val()
      본문: $('#본문').val()
    $('#제목').val('')
    $('#본문').val('')
  'click #로그인': (evt, tmpl) ->
    evt.preventDefault()
    이메일 = $('#이메일').val()
    비밀번호 = $('#비밀번호').val()

    if not 이메일 or 이메일.length <= 0 then return alert '이메일을 입력 해 주세요.'
    user = User.findOne 이메일: 이메일
    cl user
    if user?
      if user.비밀번호 is 비밀번호 then SessionStore.set '사용자키', user._id
    else
      if confirm '등록 된 사용자가 없습니다. 해당 정보로 가입 하시겠습니까?'
        if not 비밀번호 or 비밀번호.length <= 0 then return alert '비밀번호를 입력 해 주세요'
        _id = User.insert
          이메일: 이메일
          비밀번호: 비밀번호

        SessionStore.set '사용자키', _id

  'click #로그아웃': (evt, tmpl) ->
    evt.preventDefault()
    SessionStore.set '사용자키', undefined


