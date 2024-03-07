{
  pkgs, ...
}: {
      
  programs.bash = {
    enable = true;
    bashrcExtra = ''
export LD_LIBRARY_PATH=
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
export PATH=$PATH:~/go/bin:~/binaryninja:~/idafree-8.3:~/.local/bin
export BASH_SILENCE_DEPRECATION_WARNING=1

eval "$(direnv hook bash)"
eval "$(starship init bash)"

alias l='ls'
alias ll='ls -lah'
alias cls='clear'
alias lvim='vim -u ~/.config/vim/vimrc.light'

function cpsl {
  cp `readlink $1` $2
}

function len {
    echo $1 | wc -c
}
    '';
  };
}
