## My .dotfiles
- .config/
	- [fish](https://github.com/fish-shell/fish-shell): shell
	- [helix](https://github.com/helix-editor/helix): Helix editor
	- [i3](https://github.com/i3/i3): window manager
	- [kmonad](https://github.com/kmonad/kmonad): Keyboard layout and layers manager
	- [lazygit](https://github.com/jesseduffield/lazygit): TUI application for git commands
	- [nvim](https://github.com/neovim/neovim): Neovim editor
	- [picom](https://github.com/yshui/picom): X Compositor for window transparency
	- [polybar](https://github.com/polybar/polybar): i3wm status bar
	- surfingkeys_config.js: [SurfingKeys](https://github.com/brookhong/Surfingkeys) browser extension for web navigation using vim-like keys
	- [wezterm](https://github.com/wez/wezterm): Terminal emulator and multiplexer

## Setup
My dotfiles setup is based on the instructions from [this comment on HN](https://news.ycombinator.com/item?id=11070797) and [this blog post from atlassian](https://www.atlassian.com/git/tutorials/dotfiles).


The way this works is by creating a bare git repository and setting the work-tree to the `$HOME` directory, and specifying this work-tree every time a change is made to this repo, to make this step easier an *alias* is defined. This allows me to keep the config files at their locations, avoiding symlinks.

### First setup
```bash
git init --bare $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
dotfiles remote add github git@github.com:thlsrms/dotfiles.git
```
In my case, using `fish` shell I add my **dotfiles** alias as a function in my `config.fish` file.


Now git commands such as `git add | commit | push` can be used to track relevant config files using: `dotfiles add | commit | push`

### New system setup
To avoid conflicts, for possibly having some default config files in the new system's `$HOME` directory, the repository must be cloned to a temporary directory.
```bash
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/thlsrms/dotfiles.git tmpdotfiles
rsync --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/
rm -r tmpdotfiles
dotfiles config --local status.showUntrackedFiles no
```

