
ruleset server_stuff {
  meta {
    name "Server Stuff"
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
  rule hello is active {
  select when echo hello
  send_directive("say") with
    something = "Hello World";
  }
   
  rule echo is active {
  select when echo message input "(.*)" setting(m)
  send_directive("say") with
    something = m;
  }
 
}