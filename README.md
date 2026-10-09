# dotfiles

Personal macOS profile, managed with [GNU Stow](https://www.gnu.org/software/stow/).
Each directory under `packages/` is a stow *package* that mirrors the layout of `$HOME`
(e.g. `packages/zsh/.zshrc` → `~/.zshrc`).

## Layout

| Package    | Contents                                   |
| ---------- | ------------------------------------------ |
| `zsh`      | `.zshrc` (oh-my-zsh + starship/atuin/zoxide) |
| `git`      | `.gitconfig` (delta, GPG signing, sane defaults) |
| `tmux`     | `.tmux.conf` (tpm, catppuccin)             |
| `nvim`     | Neovim config (lazy.nvim, LSP, conform)    |
| `ghostty`  | Ghostty terminal config                    |
| `starship` | Prompt                                     |
| `atuin`    | Shell history                              |
| `bat`, `zed`, `gnupg` | Tool configs                    |

`Brewfile` lists all Homebrew formulae, casks, VS Code extensions and Go tools.

## Install

```sh
git clone git@github.com:xwjdsh/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install            # SKIP_BREW=1 ./install to skip `brew bundle`
```

`install` runs `brew bundle`, installs oh-my-zsh if missing, stows **every**
directory under `packages/` (new packages are picked up automatically), installs tmux
plugins via tpm, and links iCloud Drive to `~/icloud` on macOS.

Stow refuses to overwrite existing real files — move an existing `~/.zshrc`
etc. out of the way first.

## Notes

- Machine-specific shell settings go in `~/.zshrc.local` (not tracked).
- `packages/gnupg/.gnupg/gpg-agent.conf` assumes Apple Silicon Homebrew paths.
- Neovim config targets Neovim 0.11+.
