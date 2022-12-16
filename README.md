## .dotfiles
- .config/
	- [alacritty](https://github.com/alacritty/alacritty): terminal emulator
	- [fish](https://github.com/fish-shell/fish-shell): shell
		- [fisher](https://github.com/jorgebucaran/fisher): fish plugin manager
			- [patrickf1/fzf.fish](https://github.com/PatrickF1/fzf.fish) - FuzzyFinder utilities
			- [jethrokuan/z](https://github.com/jethrokuan/z) - z for directory jumping
			- [gazorby/fish-exa](https://github.com/gazorby/fish-exa) - exa (better ls) aliases for fish
	- [i3](https://github.com/i3/i3): window manager
	- [kmonad](https://github.com/kmonad/kmonad): Keyboard layout and layers manager
	- [lazygit](https://github.com/jesseduffield/lazygit): TUI application for git commands
	- [neovim](https://github.com/neovim/neovim): editor
		- [packer.nvim](https://github.com/wbthomason/packer.nvim) - neovim plugin manager
	- [omf](https://github.com/oh-my-fish/oh-my-fish): oh-my-fish for fish shell
	- [picom](https://github.com/yshui/picom): window transparency
	- [polybar](https://github.com/polybar/polybar): i3wm status bar
	- [zellij](https://github.com/zellij-org/zellij): terminal multiplexer
	- surfingkeys_config.js: [SurfingKeys](https://github.com/brookhong/Surfingkeys) browser extension for web navigation using vim-like keys

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


Now git commands such as `git add`` | commit | push` can be used to track relevant config files using: `dotfiles add | commit | push`

### New system setup
To avoid conflicts, for possibly having some default config files in the new system's `$HOME` directory, the repository must be cloned to a temporary directory.
```bash
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/thlsrms/dotfiles.git tmpdotfiles
rsync --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/
rm -r tmpdotfiles
```

