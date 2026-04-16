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

typeset -g WISE_API_TOKEN
WISE_API_TOKEN="$(_keychain_env WISE_API_TOKEN)"
[[ -n "$WISE_API_TOKEN" ]] && export WISE_API_TOKEN

typeset -g PLUGGY_CLIENT_ID
PLUGGY_CLIENT_ID="$(_keychain_env PLUGGY_CLIENT_ID)"
[[ -n "$PLUGGY_CLIENT_ID" ]] && export PLUGGY_CLIENT_ID

typeset -g PLUGGY_CLIENT_SECRET
PLUGGY_CLIENT_SECRET="$(_keychain_env PLUGGY_CLIENT_SECRET)"
[[ -n "$PLUGGY_CLIENT_SECRET" ]] && export PLUGGY_CLIENT_SECRET

unset -f _keychain_env
