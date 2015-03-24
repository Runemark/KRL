
ruleset server_stuff {
  meta {
    name "See Songs Explicit"
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

  rule sung is active {
    select when sung song "(.*)" setting(m)
    send_directive("sung") with
      song = m;
  }

  rule songs is active {
    select when echo message msg_type re#song# setting(m)
    send_directive("sing") with
      song = m;
    always {
      raise explicit event sung with
        song = m;
    }
  }
}