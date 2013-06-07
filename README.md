# My dotfiles

These are my personal dotfiles.  They setup an environment the way I like it.

## Installation

Run these commands

```sh
git clone git://github.com/pandu1986/dotfiles ~/.dotfiles
cd ~/.dotfiles
gem install bundler
bundle
bundle exec rake install
```

Now, add this to your `~/.bash_profile` or `~/.bashrc` or whatever:

```bash
# source in dotfiles
if [ -f ~/.bash_dotfiles.sh ]; then
  . ~/.bash_dotfiles.sh
fi
```

## Environment

I am running on Mac OS X, bash.
