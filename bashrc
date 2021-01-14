# ~/.bashrc: executed by bash(1) for non-login shells.

# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.
# PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
# umask 022

# You may uncomment the following lines if you want `ls' to be colorized:
# export LS_OPTIONS='--color=auto'
# eval "`dircolors`"
# alias ls='ls $LS_OPTIONS'
# alias ll='ls $LS_OPTIONS -l'
# alias l='ls $LS_OPTIONS -lA'
#
# Some more alias to avoid making mistakes:
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'

alias python='/usr/bin/python3.7'
PYTHONPATH=$HOME/lib/python
EDITOR=vim

export PYTHONPATH EDITOR

function newsong () {
  echo "Adding new artist?: "
  read new_artist

  if [ "$new_artist" = "y" ]; then
    echo "Enter the artist/band"
    read artist
    echo "Enter the artist/band in english"
    read artist_in_english
  fi

  echo "Enter the artist/band directory: "
  read artist_dir

  if [ "$new_artist" = "y" ]; then
    cd /var/www/moshna/songs/allartists/
    echo "$artist ($artist_in_english) - $artist_dir" >> artists.txt
    parse_artists
  fi

  echo "Enter the song: "
  read song 
  echo "Enter the song in english: "
  read song_in_english 
  echo "Enter the song directory: "
  read song_dir 
  echo "Enter embedded youtube link: "
  read link
  mkdir "/var/www/moshna/songs/$artist_dir/$song_dir"
  cd "/var/www/moshna/songs/$artist_dir/$song_dir"
  touch interpretation.txt
  echo $song_in_english >> interpretation.txt
  touch original.txt
  echo $song >> original.txt
  touch youtube.txt
  echo $link >> youtube.txt
  parse_song
  cd ..
  if [ "$new_artist" = "y" ]; then
    echo "$artist ($artist_in_english)" >> allsongs.txt
    echo "" >> allsongs.txt
  fi
  echo "$song ($song_in_english) - $song_dir" >> allsongs.txt
  parse_all_songs
}


function newplay () {
  cd /var/www/moshna/plays/allplays
  echo "\"$1\" $2 - $3" >> plays.txt
  parse_plays
  cd ../$3
  touch roles.txt
  touch rehearsal.txt
}

function gtsnc () {
  cd /var/www/moshna/git_repo
  cp ~/../bin/parse_* ./python/
  cp ~/.vimrc ./vimrc
  cp ~/.bashrc ./bashrc
}
