# macOS Dev Setup

Yet another guide to setting up an web/android oriented development workspace on macOS

# 1. Run the Script [or follow see step-by-step](README.md#step-by-step)

To use this script, first you must install XCode, or the XCode Command Line Tools. To install the command line tools, use the command:

`xcode-select --install`

Then you can use the script!

`sh -c "$(curl -fsSL https://github.com/jforatier/mac-dev-setup/blob/main/setup.sh)"`

# 2. Complete with manual steps

## Configure your ZSH on steroids, _add these lines to your ~/.zshrc_

```bash
plugins=(git colored-man-pages colorize github jira vagrant virtualenv pip python brew macos zsh-syntax-highlighting zsh-autosuggestions)

ZSH_THEME="agnoster"
DEFAULT_USER="yourusername"
```

## Configure shell to use zsh, _type this line in your iTerm2 shell_

```bash
chsh -s /bin/zsh
```

### Restart iTerm2

## Configure iTerm2

1. Install font Meslo LG M Regular for Powerline

   ```zsh
   git clone https://github.com/powerline/fonts.git ~/tempFonts

   ~/tempFonts/install.sh
   ```

2. Go to iTerm2 / Preferences / Profiles / Text / Change Font / Meslo LG M Regular for Powerline.

   Make sure the option `Use a different font for non-ASCII character` is **not** checked.

3. Go to iTerm2 / Preferences / Profiles / Colors / Colors presets / Solarized Dark

4. Go to iTerm2 / Preferences / Profiles / Windows / Transparency + Blur

5. Delete downloaded font files

   ```zsh
   rm -Rf ~/tempFonts
   ```

## Configure your editor, _add these lines to your ~/.zshrc_

```zsh
export EDITOR="code -w"
alias edit="code -nw"
```

> 💡 Feel free to suggest any script evolution in order to script this part

## How to open Visual Studio Code from the command line on OSX? [source](https://stackoverflow.com/a/29971430)

_Tip: If you want to run VS Code from the terminal by simply typing 'code', VS Code has a command, Shell Command: Install 'code' command in PATH, to add 'code' to your $PATH variable list._

After installation, launch VS Code. Now open the Command Palette (F1 or ⇧+⌘+P on Mac) and type `shell command` to find the `Shell Command: Install 'code' command in PATH command.`

After executing the command, restart the terminal for the new $PATH value to take effect. You'll be able to simply type 'code .' in any folder to start editing files in that folder.

## Q&A

### Oh-my-zsh showing weird character '?' on terminal

Maybe you skipped the part [Configure iTerm2](README.md#Configure_iTerm2)

Installing a powerline patched font will solve this. This [official documentation](https://powerline.readthedocs.io/en/latest/installation.html#fonts-installation) provides description about installing poweline fonts.

[Addition info there](https://stackoverflow.com/questions/42271657/oh-my-zsh-showing-weird-character-on-terminal)

## Step-by-Step

### Prepare Git

### Install Homebrew

### Prepare Git

### Install Python

### [How to use Visual Studio Code as the default editor for Git MergeTool](https://stackoverflow.com/questions/44549733/how-to-use-visual-studio-code-as-the-default-editor-for-git-mergetool)

### [Using VS Code to git rebase](https://dev.to/colbygarland/using-vs-code-to-git-rebase-1lc)

## Credits

- [Adam Kelly - DevMyMac](https://github.com/adamisntdead/DevMyMac)
- [Cyril Lakech - macbook-pro-setup](https://github.com/clakech/macbook-pro-setup)
- [Nicolas Hery - mac-dev-setup](https://github.com/nicolashery/mac-dev-setup)
