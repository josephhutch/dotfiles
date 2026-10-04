# dotfiles

My macOS shell and tool configuration, plus a bootstrap script to set up a new Mac.

- **Homebrew** installs everything listed in the `Brewfile`.
- **GNU Stow** symlinks each package folder (`zsh`, `git`, `mise`) into `$HOME`.
- **antidote** loads the zsh plugins listed in `zsh/.zsh_plugins.txt`.
- **mise** manages language versions per project, so nothing is installed globally.

## Setting up a new Mac

1. Install Homebrew. This also installs the Xcode Command Line Tools, which provide `git`:

   ```sh
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. Clone this repo and run the bootstrap script:

   ```sh
   git clone https://github.com/josephhutch/dotfiles.git ~/code/dotfiles
   cd ~/code/dotfiles
   ./bootstrap.sh
   ```

3. Open a new terminal window to load the shell config.

The bootstrap stops without linking anything if a file it manages (such as `~/.zshrc`) already exists. Move or delete that file and run `./bootstrap.sh` again. The script is safe to re-run at any time.

## Making changes

- Add a tool: add a `brew "name"` or `cask "name"` line to `Brewfile` and re-run `./bootstrap.sh`.
- Add a config file: put it in a package folder at the same path it should have relative to `$HOME`, add the package to `packages_to_stow` in `bootstrap.sh` if it's new, and re-run `./bootstrap.sh`.
