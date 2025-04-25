ENABLE_CORRECTION="true"
HIST_STAMPS="mm/dd/yyyy"

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

if [ -d "$HOME/Apps/nvim-linux64/bin" ] ; then
    PATH="$HOME/Apps/nvim-linux64/bin:$PATH"
fi
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# PROMPT_EOL_MARK='%F{8}󰌑%f'

#########
# Prompt #
##########
setopt PROMPT_SUBST

# Working directory
PROMPT='%B<$USER>%b %{$fg[red]%}%B%3~%b%{$reset_color%} '

# Conda integration
PROMPT+='['
PROMPT+='%{$fg[yellow]%}${CONDA_DEFAULT_ENV:+" $CONDA_DEFAULT_ENV "}%{$reset_color%}'

# Jenv integration
precmd_jenv_info() {
    if (( $+commands[jenv] )); then
        jenv_info="$(jenv version-name)"
        if [[ "${jenv_info}" = system ]]; then
            jenv_info=
        fi
    fi
}

precmd_functions+=( precmd_jenv_info )
PROMPT+='${jenv_info:+" $jenv_info "}'
# Git integration

zstyle ':vcs_info:git*' formats '%b'
zstyle ':vcs_info:git*' actionformats '%b (%a)'
autoload -Uz vcs_info
precmd_vcs_info() {
    vcs_info
    if [[ "${#vcs_info_msg_0_}" -ge 15 ]]; then
        vcs_info_msg_0_="${vcs_info_msg_0_:0:12}..."
    fi
}

precmd_functions+=( precmd_vcs_info )
PROMPT+='${vcs_info_msg_0_:+" $vcs_info_msg_0_ "}'
PROMPT+=']'

# Exit code and superuser integration
PROMPT+='%(?.%F{white}.%F{white})❯%(!.❯.)%f'

################
# Right Prompt
################
# show hostname
RPROMPT='[%t-%D{%d/%m/%y}]'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/km02/Apps/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/km02/Apps/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/km02/Apps/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/km02/Apps/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
conda config --set changeps1 False
# <<< conda initialize <<<

eval "$(zoxide init zsh)"
