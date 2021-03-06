#!/usr/bin/env bash

# ---------------------------------------------------------------------------- #
if heading_if "Installs"; then
# ---------------------------------------------------------------------------- #

request_sudo || abort

subheading "System packages"
update_package_manager
install_package "bash" "Bash"
install_package "curl" "cURL"
install_package "docker" "Docker"
install_package "git" "Git"
install_package "make"
install_package "tmux"
install_package "python"
install_package "python3"
install_package "xclip"
install_package "vim" "Vim"
install_package "wget" "Wget"
install_package "zsh" "Zsh"

subheading "Binaries"
install_crate "sharkdp/bat"
install_crate "rust-embedded/cross"
install_crate "sharkdp/hyperfine"
install_crate "casey/just"
install_crate "BurntSushi/ripgrep" --bin rg
install_crate "rossmacarthur/sheldon"

subheading "Scripts"
symlink "bin/cargo-grcov.sh" ".local/bin/cargo-grcov"
symlink "bin/femtocom.sh"    ".local/bin/femtocom"
symlink "bin/gensshkey.sh"   ".local/bin/gensshkey"
symlink "bin/ips.py"         ".local/bin/ips"

fi
# ---------------------------------------------------------------------------- #
if heading_if "Python development" "python"; then
# ---------------------------------------------------------------------------- #

subheading "System packages"
install_packages "build-essential" "llvm"
install_packages "libbz2-dev" "libffi-dev" "liblzma-dev" "libncurses5-dev" "libreadline-dev" \
                  "libsqlite3-dev" "libssl-dev" "libxml2-dev" "libxmlsec1-dev" "zlib1g-dev"

subheading "Environment"
install_pyenv
install_pyenv_python3
create_pyenv_virtualenv

subheading "Packages"
install_python_package "awscli"
install_python_package "nanocom" "Nanocom"
install_python_package "passthesalt" "PassTheSalt"

fi
# ---------------------------------------------------------------------------- #
if heading_if "Rust development" "rust"; then
# ---------------------------------------------------------------------------- #

subheading "Environment"
install_rustup
install_rust_toolchain "stable"
install_rust_toolchain "beta"

subheading "Packages"
install_cargo_package "cargo-edit"

fi
# ---------------------------------------------------------------------------- #
if heading_if "Configurations" "configs"; then
# ---------------------------------------------------------------------------- #

subheading "General"
symlink "curl/curlrc"             ".curlrc"
symlink "git/gitconfig"           ".gitconfig"
symlink "git/gitignore_global"    ".gitignore_global"
symlink "sheldon/plugins.toml"    ".sheldon/plugins.toml"
symlink "tmux/tmux.conf"          ".tmux.conf"
symlink "vim/vimrc"               ".vimrc"
symlink "vscode/settings.json"    ".config/Code/User/settings.json"
symlink "vscode/keybindings.json" ".config/Code/User/keybindings.json"

subheading "Zsh"
symlink "zsh/zprofile" ".zprofile"
symlink "zsh/zshrc"    ".zshrc"
symlink_zsh_plugin "aliases"
symlink_zsh_plugin "ubuntu/aliases" "aliases_bootstrap"
symlink_zsh_plugin "compinit"
symlink_zsh_plugin "gpg-agent"
symlink_zsh_plugin "path"
symlink_zsh_plugin "pyenv"

fi
