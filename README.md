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
| `bin`      | Scripts in `~/.local/bin` (`brew-add`, `brew-drop`, `brew-sync`)   |

`Brewfile` lists all Homebrew formulae and casks.
Use `brew add <name>` (`--cask` to force a cask) to install something and
record it in the Brewfile in one step.
`brew drop <name>` does the reverse: uninstalls it (casks with `--zap`), removes
orphaned dependencies and deletes its Brewfile entry.
`brew sync` updates Homebrew, installs anything missing, upgrades outdated
entries and cleans up; `brew sync --check` only reports what is missing, outdated
or installed without being in the Brewfile.

## Install

```sh
git clone git@github.com:xwjdsh/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install            # Homebrew, stow, oh-my-zsh, links every package
brew sync            # install everything in the Brewfile
```

Then start tmux and press `prefix + I` to install its plugins (tpm comes from
the Brewfile).

`install` installs Homebrew, stow and oh-my-zsh if missing, stows **every**
directory under `packages/` (new packages are picked up automatically) and links
iCloud Drive to `~/icloud` on macOS.

Stow refuses to overwrite existing real files — move an existing `~/.zshrc`
etc. out of the way first.

## Notes

- Machine-specific shell settings go in `~/.zshrc.local` (not tracked).
- `packages/gnupg/.gnupg/gpg-agent.conf` assumes Apple Silicon Homebrew paths.
- Neovim config targets Neovim 0.11+.
