# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk
zinit ice depth=1; zinit light romkatv/powerlevel10k
  zinit light zsh-users/zsh-syntax-highlighting
  zinit light zsh-users/zsh-completions
  zinit light zsh-users/zsh-autosuggestions
  zinit light Aloxaf/fzf-tab

  #snippets
  zinit snippet OMZP::git
  zinit snippet OMZP::sudo
  zinit snippet OMZP::archlinux
  zinit snippet OMZP::aws
  zinit snippet OMZP::golang
  zinit snippet OMZP::terraform
  zinit snippet OMZP::nvm
  zstyle ':omz:plugins:nvm' lazy yes
  # zinit snippet OMZP::docker
  zi ice as"completion"
  zi snippet OMZP::docker/completions/_docker

  # Load completions
  autoload -U compinit && compinit
  zinit cdreplay -q
  bindkey -e
  bindkey '^p' history-search-backward
  bindkey '^n' history-search-forward
  bindkey "^[[1;3C" forward-word
  bindkey "^[[1;3D" backward-word

  zstyle ':completion:*:default' list-colors "$LS_COLORS"
  zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
  zstyle ':completion:*' menu no
  zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

  HISTFILE=~/.histfile
  HISTSIZE=5000
  SAVEHIST=$HISTSIZE
  HISTDUPE=erase
  setopt appendhistory
  setopt sharehistory
  setopt hist_ignore_space
  setopt hist_save_no_dups
  setopt hist_ignore_dups
  setopt hist_find_no_dups

  eval "$(fzf --zsh)"
#### END ####

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#### ALIAS ####
  alias ls="ls -G"
  alias lsa="ls -alh"
  alias activate="source ./.venv/bin/activate"
  alias dcu='docker compose up -d'
  alias dcd='docker compose down'
  alias da='docker attach --sig-proxy=false'
  alias mux='tmuxinator'
  alias go_hash='TZ=UTC git --no-pager show \
    --quiet \
    --abbrev=12 \
    --date='format-local:%Y%m%d%H%M%S' \
    --format="%cd-%h"'

  alias docker_clean_containers='docker ps -aq --no-trunc | xargs docker rm'
  alias docker_clean_images='docker rmi $(docker images -q -f dangling=true)'

  alias ogh='basePWD=$(basename "$PWD");open "https://github.com/jackboxgames/$basePWD"'
  alias vi='nvim'
  alias vim='nvim'
#### END ####


#### TMUX ####
  _tmuxinator() {
    local commands projects
    commands=(${(f)"$(tmuxinator commands zsh)"})
    projects=(${(f)"$(tmuxinator completions start)"})

    if (( CURRENT == 2 )); then
      _alternative \
        'commands:: _describe -t commands "tmuxinator subcommands" commands' \
        'projects:: _describe -t projects "tmuxinator projects" projects'
    elif (( CURRENT == 3)); then
      case $words[2] in
        copy|cp|c|debug|delete|rm|open|o|start|s|edit|e)
          _arguments '*:projects:($projects)'
        ;;
      esac
    fi

    return
  }
  compdef _tmuxinator tmuxinator mux

  update_win_name() {
    ~/.tmux/update_win_name.sh
  }

  # Call the function whenever the directory changes
  if [ "$SHELL" = "/bin/bash" ]; then
      PROMPT_COMMAND="update_win_name;$PROMPT_COMMAND"
  elif [ "$SHELL" = "/bin/zsh" ]; then
      precmd_functions+=(update_win_name)
  fi
#### END ####

#### TERRAFORM ####
  ZSH_THEME_TF_PROMPT_PREFIX="%{$fg[white]%}"
  ZSH_THEME_TF_PROMPT_SUFFIX="%{$reset_color%}"
  ZSH_THEME_TF_VERSION_PROMPT_PREFIX="%{$fg[white]%}"
  ZSH_THEME_TF_VERSION_PROMPT_SUFFIX="%{$reset_color%}"

  RPROMPT='$(tf_prompt_info)'
  RPROMPT='$(tf_version_prompt_info)'

#### END ####

#### EXPORTS ####
  export PATH=$PATH:/usr/local/go/bin
  export GOPATH="$HOME/go"
  export PATH="$GOPATH/bin:$PATH"
  export GIT_EDITOR=vim
  export EDITOR=vim
#### END ####

[[ ! -f ~/.zshrc.local ]] || source ~/.zshrc.local

