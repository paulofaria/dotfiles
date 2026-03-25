# Chezmoi Dotfiles

This is a chezmoi-managed dotfiles repository. The source directory is `~/.local/share/chezmoi/`.

## Chezmoi Workflow

### Editing files
- Edit source files directly in this directory, or use `chezmoi edit <target-file>`
- Use `chezmoi edit --apply <file>` to edit and auto-apply on quit
- Use `chezmoi re-add` if you edited a file directly in `~` and want to pull changes back into source

### Previewing changes
- `chezmoi diff` — preview what `apply` would change in `~`
- `chezmoi status` — quick summary of pending changes

### Applying changes
- `chezmoi apply` — apply source state to home directory
- `chezmoi apply --exclude=scripts` — apply managed files only, skip scripts

### Git operations (commit/push)
Use `chezmoi git` to run git commands inside the source directory:
```sh
chezmoi git add .
chezmoi git -- commit -m "message"
chezmoi git push
```
Or use `chezmoi cd` to drop into a shell in the source dir and use git directly.

Note: when passing flags like `-m` to git via `chezmoi git`, use `--` to prevent chezmoi from consuming them.

### Pulling on another machine
- `chezmoi update` — pulls remote changes and applies them
- `chezmoi init --apply <github-username>` — clone and apply in one step on a fresh machine

## File naming conventions
- `dot_` prefix → `.` (e.g., `dot_zshrc` → `~/.zshrc`)
- `private_` prefix → file permissions set to 0600
- `run_once_before-` → bootstrap script that runs once before applying
- `run_once_after-` → script that runs once after applying

## Scripts
- `run_once_before-install-packages-darwin.sh` — Homebrew packages, oh-my-zsh, zsh plugins, nvm, Rust, Claude Code CLI
- `run_once_after-install-packages-darwin.sh` — Node LTS via nvm, global JS tooling
- `run_once_after-configure-darwin.sh` — macOS Dock and Finder defaults
