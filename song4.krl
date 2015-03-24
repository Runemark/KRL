
ruleset server_stuff {
  meta {
    name "See Songs Found"
    description <<
Server Ruleset
>>
    author "Martin Mumford"
    logging on
    sharing on
    provides test
 
  }
  global {
    test = function(obj) {
      msg = "Hello " + obj
      msg
    };
 
  }

  rule found_hymn is active {
    select when explicit found_hymn song "(.*)" setting(m)
    send_directive("found hymn") with
      hymn = m;
  }

  rule sung is active {
    select when explicit sung song re#(.*)god(.*)#i setting(m)
    send_directive("sung") with
      song = m;
    always {
       raise explicit event found_hymn with
          song = m
    }
  }

  rule sing is active {
    select when echo message msg_type re#song# msg_body "(.*)" setting(n)
    send_directive("sing") with
      song = n;
    always {
      raise explicit event sung with
        song = n;
    }
  }
}