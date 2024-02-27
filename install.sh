#!/bin/bash

set -e

exists() {
	type "$1" &>/dev/null
}

install_packages_for_darwin() {
	# homebrew
	if exists brew; then
		echo "[homebrew] is installed, nothing to do here"
	else
		echo "[homebrew] is not installed, installing now"
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	fi

	# homebrew packages
	cmd_packages=(
		fzf nvim bat fd gpg htop lazydocker rclone glow jq hugo ag ripgrep sing-box
		iredis yazi cloudflared telnet lsd atuin thefuck tlrc tree gping httpie         # tools
		git-delta git-extras git-crypt gh lazygit                                       # git
		zsh-syntax-highlighting zsh-autosuggestions                                     # zsh plugins
		go node rust pyenv corepack pipx                                                # dev
		pyright lua-language-server rust-analyzer gopls bash-language-server shellcheck # lsp
		stylua rustfmt ruff prettier taplo shfmt                                        # formatter
		gpg pinentry-mac                                                                # gpg (pinentry-mac: prompt enter gpg passphrase when required)
		tmux tpm reattach-to-user-namespace                                             # tmux (reattach-to-user-namespace: fix tmux copy-paste)
	)
	app_packages=(
		git-credential-manager visual-studio-code zed proxyman tailscale codewhisperer
		cloudflare-warp stats orbstack sequel-ace fork iterm2 sfm dbeaver-community rapidapi redisinsight # dev related
		hiddenbar numi menubarx google-drive telegram google-chrome raycast spotify
		bing-wallpaper obsidian wechat webull whatsapp lark feishu eudic snipaste # tools
		homebrew/cask-fonts/font-hack-nerd-font                                   # font
	)

	echo "[homebrew] install cmd packages"
	brew install "${cmd_packages[@]}"

	echo "[homebrew] install app packages"
	brew install "${app_packages[@]}"

}

OS="$(uname)"
case $OS in
'Linux')
	echo "install packages for linux currently not supported"
	;;
'Darwin')
	install_packages_for_darwin
	;;
*) ;;
esac

# on-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
	echo "[on-my-zsh] is not installed, installing now"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
	echo "[on-my-zsh] is installed, nothing to do here"
fi

if exists go; then
	echo "[go] installing go related tools"
	go install golang.org/x/tools/cmd/goimports@latest
	go install github.com/cosmtrek/air@latest
	go install golang.org/x/tools/cmd/deadcode@latest
fi

if exists npm; then
	echo "[node] installing node related tools"
	npm install --g git-open
fi

if exists pipx; then
	echo "[python] installing python related tools"
	pipx ensurepath
	pipx install pdm
fi

echo "[dotfiles]"
export DOTFILES="$HOME/.dotfiles"
if [ -d "$DOTFILES" ]; then
	echo "[dotfiles] have already been cloned into the home dir"
else
	echo "[dotfiles] cloning..."
	git clone https://github.com/xwjdsh/dotfiles.git ~/.dotfiles
fi

cd "$DOTFILES"
git submodule update --init --recursive
"$DOTFILES"/install

echo "all done!"
exit 0
