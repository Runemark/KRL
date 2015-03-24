
ruleset server_stuff {
  meta {
    name "Song Store"
    description <<
Song Store
>>
    author "Martin Mumford"
    logging on
    sharing on
    provides songs
    provides hymns
    provides secular_music
  }

  global {
    songs = function(obj) {
      songlist = ent:sung_songs || [];
      songlist
    };

    hymns = function(obj) {
      hymnlist = ent:sung_hymns || [];
      hymnlist
    };

    secular_music = function(obj) {
      hymnlist = ent:sung_hymns || [];
      songlist = ent:sung_songs || [];
      secularlist = songlist.difference(hymnlist);
      secularlist
    };
  }

  rule collect_songs {
    select when explicit sung song "(.*)" setting(title)
    pre {
      songs = ent:sung_songs || [];
      new_array = songs.union(title)
    }
    send_directive("collect_songs") with
      song = title;
    if (not songs.has(title)) then {
      noop();
    }
    fired {
      set ent:sung_songs new_array
    }
  }

  rule collect_hymns is active {
    select when explicit hymn_found song "(.*)" setting(title)
    pre {
      hymns = ent:sung_hymns || [];
      new_array = hymns.union(title)
    }
    send_directive("collect_hymns") with
      song = title;
    if (not hymns.has(title)) then {
      noop();
    }
    fired {
      set ent:sung_hymns new_array
    }
  }

  rule clear_songs is active {
    select when song reset
    pre {
      hymns = ent:sung_hymns || [];
      songs = ent:sung_songs || [];
    }
    send_directive("songs reset")
    if (hymns.length() == 0 && songs.length() == 0) then {
      noop();
    }
    fired {
      set ent:sung_hymns [];
      set ent:sung_songs []; 
    }
  }
}