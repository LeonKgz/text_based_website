syntax on
set number
set ruler
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
set smarttab
color desert
set nosol
:au BufWritePost roles.txt :silent exec "!parse_roles"
:au BufWritePost plays.txt :silent exec "!parse_plays"
:au BufWritePost rehearsal.txt :silent exec "!parse_rehearsal"

:au BufWritePost menu.html :silent exec "!parse_rehearsal"
:au BufWritePost menu.html :silent exec "!parse_roles"

:au BufWritePost original.txt :silent exec "!parse_song"
:au BufWritePost interpretation.txt :silent exec "!parse_song"
:au BufWritePost youtube.txt :silent exec "!parse_song"
:au BufWritePost details.txt :silent exec "!parse_song"

:au BufWritePost artists.txt :silent exec "!parse_artists"
:au BufWritePost allsongs.txt :silent exec "!parse_all_songs"
