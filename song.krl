
ruleset server_stuff {
  meta {
    name "See Songs"
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
   
  rule songs is active {
  select when echo message input "(.*)" setting(m)
  send_directive("sing") with
    song = m;
  }
 
}