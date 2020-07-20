# macOS setup

Not everything is (or should be) automated by the dotfiles bootstrap script.
This document outlines various other steps in setting up a new macOS laptop. I
try to keep this up to date with the latest tools and apps that I am using.

See also

- [Workspace volume](Workspace.md)
- [GNU Privacy Guard](GnuPG.md)

## Package manager

Homebrew is a package manager for macOS. It allows us to install GNU command
line tools and macOS apps using the `brew` command line tool. From the
[homepage](https://brew.sh) follow the installation instructions.

## Core apps

- [1Password](https://1password.com/downloads/mac): Password storage and
  management.
  ```
  brew cask install 1password
  ```

- [Docker for
  Mac](https://hub.docker.com/editions/community/docker-ce-desktop-mac)
  ```
  brew cask install docker
  ```

- [iTerm2](https://iterm2.com): Better Terminal.
  ```
  brew cask install iterm2
  ```

- [Visual Studio Code](https://code.visualstudio.com): Integrated development
  environment for all things.
  ```
  brew cask install visual-studio-code
  ```

## Communication apps

- Microsoft Outlook
  ```
  brew cask install microsoft-outlook
  ```

- [Slack](https://slack.com/intl/en-za/downloads/mac)
  ```
  brew cask install slack
  ```

- [WhatsApp](https://www.whatsapp.com/): Necessary evil.
  ```
  brew cask install whatsapp
  ```

- [Zoom](https://www.zoom.us/)
  ```
  brew cask install zoomus
  brew cask install zoomus-outlook-plugin
  ```

## Other apps

- [Alfred 4](http://alfredapp.com/): Better Spotlight.
  ```
  brew cask install alfred
  ```
  - System Preferences > Keyboard > Shortcuts > Disable Spotlight
  - Alfred
    - Set Advanced > Preferences folder to the `~/.dotfiles/src/alfred` folder.
    - Set key shortcut to ⌘ + Space.
    - Set Appearance to Alfred macOS.

- [Etcher](https://www.balena.io/etcher/): Flash OS images to SD cards.
  ```
  brew cask install balenaetcher
  ```

- [Firefox](https://www.mozilla.org/en-ZA/firefox/new/): Better Safari.
  ```
  brew cask install firefox
  ```

- [Kap](https://getkap.co/): Screen recorder (GIF / MP4 etc).
  ```
  brew cask install kap
  ```

- [MEGAsync](https://mega.nz/)
  ```
  brew cask install megasync
  ```
  - Setup up MEGAsync and to sync to ~/Cloud.
  - Preferences > Advanced > Disable overlay icons: ✅

- [Rectangle](https://rectangleapp.com/): Move and resize windows using keyboard
  shortcuts or snap areas.
  ```
  brew cask install rectangle
  ```

- [Scroll Reverser](https://pilotmoon.com/scrollreverser/): allows you to have a
  different scroll direction on trackpad and external mouse.
  ```
  brew cask install scroll-reverser
  ```
  For natural for trackpad and non natural for mouse. Select "Reverse Vertical"
  and "Reverse Mouse" only.

- [Spotify](https://www.spotify.com/za/download/mac/)
  ```
  brew cask install spotify
  ```

- [VLC](https://www.videolan.org/index.html): Better Quicktime.
  ```
  brew cask install vlc
  ```

### Command line tools

```
brew install shellcheck
```

## NVM

```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
```

Add the following to `.zshrc`

```sh
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
```

## Preferences

### General

- System Preferences > Accessibility > Display > Reduce motion: ✅
- System Preferences > Bluetooth > Show Bluetooth in menu bar: ✅
- System Preferences > Dock > Size: Small
- System Preferences > Dock > Automatically hide and show the Dock: ✅
- System Preferenced > General > Recent items: None
- System Preferences > Keyboard > Touch Bar shows: Expanded Control strip
- System Preferences > Keyboard > Key Repeat: Fast
- System Preferences > Keyboard > delay Until Repeat: Short
- System Preferences > Keyboard > Shortcuts > Mission Control
  - Switch to Desktop 1: ✅
  - Switch to Desktop 2: ✅
  - Switch to Desktop 3: ✅
  - Switch to Desktop 4: ✅
- System Preferences > Mission Control > Mission Control > Secondary button:
  Mouse Button 5
- System Preferences > Mission Control > Mission Control: Automatically
  rearrange spaces based on recent use: ❌
- System Preferences > Siri > Enable Ask Siri: ❌

Run the following to remove all presistent Dock apps:

```sh
defaults write com.apple.dock persistent-apps -array
killall Dock
```

### Terminal (iTerm 2)

Install dotfiles by following main [README](../../README.md) in this repo. After
starting a new terminal if you get error: "Insecure completion-dependent
directories detected" then run
```sh
compaudit | xargs chmod g-w,o-w
```

Install Powerline fonts.

- `git clone https://github.com/powerline/fonts.git`
- Open the "Font Book" app, click the Plus (+) and open the fonts/SourceCodePro
  directory.

Compile terminfo
```sh
tic ~/.dotfiles/src/terminfo/xterm-256color.terminfo
```

Set iTerm 2 > Preferences > Preferences > Load preferences from a custom folder
  or URL to `~/.dotfiles/src/iterm2`