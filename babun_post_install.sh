#!/bin/zsh

successfully() {
    $* || (echo "\nfailed" 1>&2 && exit 1)
}

fancy_echo() {
    echo "\n$1"
}

fancy_echo "Updating babun"
    successfully pact update

fancy_echo "Updating ~/.zshrc"
    successfully curl https://raw.githubusercontent.com/channias/env/master/zshrc.local -o ~/.zshrc

fancy_echo "Installing solarized dark theme and powerconsolas for mintty"
    successfully curl https://raw.githubusercontent.com/channias/env/master/minttyrc.local -o ~/.minttyrc

fancy_echo "Installing tmux"
    successfully pact install tmux

fancy_echo "Installing Tmux Plugin Manager"
    successfully git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

fancy_echo "Configuring tmux"
    successfully curl https://raw.githubusercontent.com/channias/env/master/tmux.conf -o ~/.tmux.conf

fancy_echo "Updating gitconfig"
    successfully git config --global user.name "channias"
    successfully git config --global user.email "nicolas.chancereul@gmail.com"
    successfully git config --global diff.tool "vimdiff -O"
    successfully git config --global color.ui "true"
    successfully git config --global difftool.prompt "false"
    successfully git config --global core.autocrlf "input"
    successfully git config --global core.editor "vim"
    successfully git config --global merge.tool "vimdiff"
    successfully git config --global push.default "matching"
    successfully git config --global alias.br "branch"
    successfully git config --global alias.ci "commit"
    successfully git config --global alias.cl "clone"
    successfully git config --global alias.cp "cherry-pick"
    successfully git config --global alias.co "checkout"
    successfully git config --global alias.d "difftool"
    successfully git config --global alias.st "status"
    successfully git config --global alias.last "log -1 --stat"
    successfully git config --global alias.undo "reset --hard"
    successfully git config --global alias.graph "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
    successfully git config --global alias.lg1 "log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
    successfully git config --global alias.lg2 "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"
    successfully git config --global alias.lg "!'git lg1'"
    successfully git config --global credential.helper "cache --timeout=3600"

source ~/.zshrc

