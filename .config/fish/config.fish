set fish_greeting

# set -gx EDITOR nvim
set EDITOR "emacsclient -t -a ''"
set VISUAL "emacsclient -c -a emacs"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -Ux BROWSER firefox
set -Ux GOPATH $HOME/go
set -Ux GOPATH $HOME/go
set -Ux TMUX_CONFIG $HOME/.config/tmux/.tmux.conf
# set -x MOZ_ENABLE_WAYLAND 1
set PATH $HOME/.emacs.d/bin $PATH
set PATH $HOME/.npm/bin $PATH
set PATH $HOME/.local/bin $PATH
set PATH $HOME/go/bin $PATH
set PATH $HOME/flutter/bin $PATH
set PATH /usr/local/go/bin $PATH
set PATH $HOME/.emacs.d/bin/doom $PATH
set PATH $HOME/.cargo/bin $PATH

### SET EITHER DEFAULT EMACS MODE OR VI MODE ###
function fish_user_key_bindings
  # fish_default_key_bindings
  fish_vi_key_bindings
end
### END OF VI MODE ###


alias vc="nvim ~/.config/nvim/init.vim"
alias v=nvim
alias zshrc="nvim ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias gxx="g++ -g -std=c++17 -O3 -Wall -Werror -Wextra -Wshadow -Wno-sign-compare -Wno-uninitialized"
alias unlock="sudo rm /var/lib/pacman/db.lck"
alias pacman='sudo pacman --color auto'
alias update='sudo pacman -Syyu'
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias update-fc='sudo fc-cache -fv'
alias tn="tmux -u -f $TMUX_CONFIG new"
alias td="tmux -u -f $TMUX_CONFIG new-session -d 'dev' && tmux new-window 'build&run' && tmux -2 attach-session -d"
alias ta="tmux -u -f $TMUX_CONFIG attach"
alias tt="nvim $TMUX_CONFIG"
alias za="zathura"
alias xmerge="xrdb -merge ~/.Xresources"
alias ct="bat ~/commit-msg"
alias tlmgr='TEXMFDIST/scripts/texlive/tlmgr.pl --usermode'
alias j="z | fzf | cd"
alias emacs='emacsclient -a "" -c'
alias em='/usr/bin/emacs -nw'
alias doomsync="~/.emacs.d/bin/doom sync"
alias doomdoctor="~/.emacs.d/bin/doom doctor"
alias doomupgrade="~/.emacs.d/bin/doom upgrade"
alias doompurge="~/.emacs.d/bin/doom purge"
alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias unlock='sudo rm /var/lib/pacman/db.lck'    # remove pacman lock
# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'
alias merge='xrdb -merge ~/.Xresources'



# pyenv init - | source

starship init fish | source

