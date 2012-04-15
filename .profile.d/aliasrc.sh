# short names
alias bd='bg;disown'
alias be='bundle exec'
alias g=gvim
alias ip6='ip -f inet6'
# alias jr='jruby -Ku --1.9 --server -J-Djruby.compile.fastest=true -J-Djruby.compile.fastops=true -J-Djruby.compile.fastsend=true -J-Djruby.compile.frameless=true -J-Djruby.compile.inlineDyncalls=true -J-Djruby.compile.positionless=true -J-Djruby.compile.threadless=true'
# alias jrs='jr -S'
alias la='ls -A'
alias ll='ls -lh'
alias l='ls -CF'
alias mame=sdlmame
alias md='mkdir -p'
alias pc='proxychains'
alias p='RAILS_ENV=production'
alias e='RAILS_ENV=staging'
alias pryc='bundle exec pry -r ./config/environment'
alias rd='rmdir'
alias t=tmux
alias monitor='DEBUG=1 lrun --reset-env false --network true --isolate-process false'

# default parameters
alias audacious='audacious2 -i gtkui'
alias bc='bc -l'
alias cp='cp -aviu'
alias df='df -h'
alias dosfsck='dosfsck -r -w -v'
alias du='du -hs'
alias fc='fc -e vim'
alias fgrep='fgrep --colour=auto'
alias grep='grep --colour=auto'
alias gvim='gvim -p'
alias locate='locate -b'
alias ls='ls --color=auto'
alias math='rlwrap math'
alias mv='mv -vi'
alias mysqldump='mysqldump --max_allowed_packet=90M'
alias rara='rar a -s -m4 -ol'
alias rdesktop='rdesktop -5 -z -r sound:local -r disk:Temp=/tmp -K -g 1280x782 -p -'
alias freerdp='xfreerdp -a 16 -g 1280x782 -z -x 95' 
alias rm='rm -v'
alias scp='scp -r'
alias screen='screen -R'
alias ssh='ssh -Y'
alias sshfs='sshfs -o follow_symlinks'
alias luit='luit -x -encoding gbk'
alias valgrind='valgrind --tool=memcheck --leak-check=yes'
alias wget='wget -c --timeout=5'
alias wine='env LANG=zh_CN.UTF-8 wine '
alias zip='zip -r'

# sudo
alias umount='sudo umount'
alias mount='sudo mount'

# alias -s, -g requires zsh
[[ $SHELL =~ zsh$ ]] || return

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'

local PLAYER=mplayer

# file extensions
alias -s bz2=tar xvf
alias -s chm=gnochm
alias -s c=tcc -run
alias -s gz=tar xvf
alias -s jar=java -jar
alias -s lua=lua
alias -s mo=msgunfmt
alias -s nes=fceux 
alias -s nsf=nosefart
alias -s pdf=evince
alias -s rar=unrar x
alias -s rb=ruby -Ku

alias -s doc=winword
alias -s docx=winword
alias -s pps=powerpnt
alias -s ppt=powerpnt
alias -s pptx=powerpnt

alias -s ape=$PLAYER
alias -s avi=$PLAYER
alias -s flac=$PLAYER
alias -s flv=$PLAYER
alias -s mkv=$PLAYER
alias -s mp3=$PLAYER
alias -s mpg=$PLAYER
alias -s ogg=$PLAYER
alias -s rm=$PLAYER
alias -s rmvb=$PLAYER
alias -s wma=$PLAYER
alias -s wmv=$PLAYER

autoload -U pick-web-browser
alias -s com=pick-web-browser
alias -s net=pick-web-browser
alias -s org=pick-web-browser

# suffix
alias -g L='| less'
alias -g N='&> /dev/null'
alias -g S='&> /dev/null &!'
alias -g EL='|& less'
alias -g H='| head'
alias -g EH='|& head'
alias -g T='| tail'
alias -g ET='|& tail'
alias -g M='| most'
alias -g EM='|& most'
alias -g C='2> >(while read line; do print "\e[91m"${(q)line}"\e[0m"; done)'
