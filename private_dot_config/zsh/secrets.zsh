#!/bin/zsh

_keychain_env() {
  security find-generic-password -a "$1" -s "shell-env" -w 2>/dev/null
}

typeset -g GITHUB_PERSONAL_ACCESS_TOKEN
GITHUB_PERSONAL_ACCESS_TOKEN="$(_keychain_env GITHUB_PERSONAL_ACCESS_TOKEN)"
[[ -n "$GITHUB_PERSONAL_ACCESS_TOKEN" ]] && export GITHUB_PERSONAL_ACCESS_TOKEN

typeset -g POSTGRES_URL
POSTGRES_URL="$(_keychain_env POSTGRES_URL)"
[[ -n "$POSTGRES_URL" ]] && export POSTGRES_URL

typeset -g ANNAS_SECRET_KEY
ANNAS_SECRET_KEY="$(_keychain_env ANNAS_SECRET_KEY)"
[[ -n "$ANNAS_SECRET_KEY" ]] && export ANNAS_SECRET_KEY

unset -f _keychain_env
