# the svn plugin has to be activated for this to work.

PROMPT='%{$fg_bold[red]%}➜ %{$fg_bold[green]%}%p %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%}$(svn_prompt_info)%{$reset_color%}'
RPROMPT='%{$fg[cyan]%}${PWD/#$HOME/~} %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ✗ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%} ✔  %{$reset_color%}"



ZSH_PROMPT_BASE_COLOR="%{$fg_bold[blue]%}"
ZSH_THEME_REPO_NAME_COLOR="%{$fg_bold[blue]%}"
DISABLE_AUTO_TITLE="true"

ZSH_THEME_SVN_PROMPT_PREFIX=""
ZSH_THEME_SVN_PROMPT_SUFFIX=""
ZSH_THEME_SVN_PROMPT_DIRTY="%{$fg[red]%} ✘ %{$reset_color%}"
ZSH_THEME_SVN_PROMPT_CLEAN="%{$fg[green]%} ✔ %{$reset_color%}"
