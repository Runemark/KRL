{'status' : 'success',
 'result' : 
  {
   "dispatch" : [],
   "global" : [
      {
         "lhs" : "hello",
         "rhs" : {
            "expr" : {
               "type" : "var",
               "val" : "msg"
            },
            "type" : "function",
            "vars" : [
               "obj"
            ],
            "decls" : [
               {
                  "lhs" : "msg",
                  "rhs" : {
                     "args" : [
                        {
                           "type" : "str",
                           "val" : "Hello "
                        },
                        {
                           "type" : "var",
                           "val" : "obj"
                        }
                     ],
                     "type" : "prim",
                     "op" : "+"
                  },
                  "type" : "expr"
               }
            ]
         },
         "type" : "expr"
      }
   ],
   "ruleset_name" : "hello_world",
   "rules" : [
      {
         "cond" : {
            "type" : "bool",
            "val" : "true"
         },
         "actions" : [
            {
               "action" : {
                  "source" : null,
                  "name" : "send_directive",
                  "args" : [
                     {
                        "type" : "str",
                        "val" : "say"
                     }
                  ],
                  "modifiers" : [
                     {
                        "value" : {
                           "type" : "str",
                           "val" : "Hello World"
                        },
                        "name" : "something"
                     }
                  ],
                  "vars" : null
               },
               "label" : null
            }
         ],
         "blocktype" : "every",
         "name" : "hello_world",
         "pre" : [],
         "post" : null,
         "state" : "active",
         "emit" : null,
         "callbacks" : null,
         "pagetype" : {
            "event_expr" : {
               "domain" : "echo",
               "type" : "prim_event",
               "vars" : null,
               "op" : "hello"
            },
            "foreach" : []
         }
      }
   ],
   "meta" : {
      "sharing" : "on",
      "logging" : "on",
      "provide" : {
         "names" : [
            "hello"
         ]
      },
      "name" : "Hello World",
      "author" : "Phil Windley",
      "description" : "\r\nA first ruleset for the Quickstart\r\n"
   }
}
}