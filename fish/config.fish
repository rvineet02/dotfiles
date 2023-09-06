fish_add_path ~/.local/bin
fish_add_path ~/.cargo/bin
fish_add_path /opt/homebrew/bin
fish_add_path /usr/local/texlive/2023/bin/universal-darwin
fish_add_path /usr/local/texlive/2023/bin/universal-darwin/latexmk
fish_add_path /usr/bin/python3

abbr -a prog 'cd ~/Documents/code'
abbr -a c clear
abbr -a e exit
abbr -a bu 'cd ~/Documents/code/old/programming/bu/'
abbr -a tor 'open /Applications/Brave\ Browser.app/ -n --args --tor'
abbr -a firefox 'open /Applications/Firefox.app/ -n'


function code
  set location "$PWD/$argv"
  open -n -b "com.microsoft.VSCode" --args $location
end

if command -v exa > /dev/null
	abbr -a l 'exa'
	abbr -a ls 'exa'
	abbr -a ll 'exa -l'
	abbr -a lll 'exa -la'
else
	abbr -a l 'ls'
	abbr -a ll 'ls -l'
	abbr -a lll 'ls -la'
end

function v
    if test -z $argv[1]
        nvim .
    else
        nvim $argv[1]
    end
end

# General aliases
abbr -a fishconfig 'cd /Users/vineetraju/.config/fish'
abbr -a lsa 'ls -la'

# Git aliases
abbr -a gs 'git status'
abbr -a gp 'git push'
abbr -a gp! 'git push --force-with-lease'
abbr -a ga 'git add'
abbr -a gaa 'git add --all'
abbr -a gaae 'git add --all :!'
abbr -a gccb 'git checkout -b '
abbr -a gcsb 'git checkout '
abbr -a grm 'git rm'
abbr -a gpu 'git push -u origin $(git rev-parse --abbrev-ref HEAD)'
abbr -a gbd 'git branch -d'
abbr -a gbdf 'git branch -d (git branch --sort=-committerdate | fzf | sed -e "s/[\*[:space:]]//g" | xargs)'
abbr -a gbD 'git branch -D'
abbr -a gbda 'git branch --merged | egrep -v "(^\*|master|main|dev)'
abbr -a gswf 'git switch (git branch --sort=-committerdate | fzf | sed -e "s/[\*[:space:]]//g" | xargs)'
abbr -a gsw 'git switch'
abbr -a gswc 'git switch -c'
abbr -a --set-cursor=% gcm 'git commit -m "%"'
abbr -a --set-cursor=% gcam 'git commit -am "%"'
abbr -a --set-cursor=% gac 'git add --all && git commit -m "%"'
abbr -a gd 'git diff'
abbr -a gds 'git diff --staged'
abbr -a gl 'git pull'
abbr -a grb 'git rebase'
abbr -a grbc 'git rebase --continue'
abbr -a grba 'git rebase --abort'
abbr -a grbi 'git rebase -i'
abbr -a gf 'git fetch'
abbr -a gsur 'git submodule update --recursive'
abbr -a glol 'git log --oneline'
abbr -a glopt 'git log '
abbr -a glop 'git log --pretty=fuller'

# Tmux aliases
abbr -a t 'tmux'
abbr -a ta 'tmux attach'
abbr -a tks 'tmux kill-session'
abbr -a tksa 'tmux kill-session -a'
abbr -a tmls 'tmux ls'

# Python aliases
abbr -a ve "source venv/bin/activate.fish"
abbr -a dve "deactivate"
abbr -a pipr "pip install -r requirements.txt"

# Docker compose aliases
abbr -a dcu "docker-compose up -d;dclogs"
abbr -a dclogs "docker-compose logs --follow"
abbr -a dcr "docker-compose restart"
abbr -a --set-cursor=% dcrb "docker-compose up --no-deps --detach --build %;dclogs"
abbr -a dcprune "docker system prune -a -f"

# tmux sessionizer
bind \cf tmux-sessionizer
setenv FZF_DEFAULT_OPTS "--border --color 'pointer:#B3E1A7,bg+:-1,fg+:#B3E1A7'"

# Editor
set -x EDITOR vim
set -x GIT_EDITOR $EDITOR

# colored man output
# from http://linuxtidbits.wordpress.com/2009/03/23/less-colors-for-man-pages/
setenv LESS_TERMCAP_mb \e'[01;31m'       # begin blinking
setenv LESS_TERMCAP_md \e'[01;38;5;74m'  # begin bold
setenv LESS_TERMCAP_me \e'[0m'           # end mode
setenv LESS_TERMCAP_se \e'[0m'           # end standout-mode
setenv LESS_TERMCAP_so \e'[38;5;246m'    # begin standout-mode - info box
setenv LESS_TERMCAP_ue \e'[0m'           # end underline
setenv LESS_TERMCAP_us \e'[04;38;5;146m' # begin underline

starship init fish | source

function fish_greeting
    echo
    neofetch
end


# Personal Shortcuts
abbr -a zippb "zip -e -r apr_19_2023_backup.zip /Users/vineetraju/Desktop/desktop --exclude='*.DS_Store*' --exclude='*programming*' --exclude='*Vineet-BackUp-2020*' --exclude='*dev*' --exclude='*Dani-neovim-lua-config*'--symlinks"

# Rust/Cargo
abbr -a cr "cargo run"
abbr -a cb "cargo build"

# Python
abbr -a ju "python3 -m notebook"
