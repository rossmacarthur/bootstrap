#!/usr/bin/env zsh

if [[ $UID -eq 0 ]]; then
  local user_symbol='#'
else
  local user_symbol='$'
fi

local context="%{$fg_bold[grey]%}%m%{$reset_color%} "
local ret_status="%(?:%{$fg_bold[green]%}:%{$fg_bold[red]%})${user_symbol}%{$reset_color%} "
local directory="%{$fg_bold[blue]%}%~%{$reset_color%} "

PROMPT='${context}${directory}$(git_prompt_info)${ret_status}'

if (( ${plugins[(I)virtualenv]} )); then
  PROMPT='$(virtualenv_prompt_info)'$PROMPT
fi

if (( ${plugins[(I)ip-netns]} )); then
  PROMPT='$(ip_netns_prompt_info)'$PROMPT
fi

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_VIRTUALENV_PREFIX="("
ZSH_THEME_VIRTUALENV_SUFFIX=") "
