Hey! Whassup

If you haven't been tracking your configurations in a Git repository before, you can start using this technique easily with these lines:

    git init --bare $HOME/.cfg
    alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
    config config --local status.showUntrackedFiles no
    echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.zshrc

- The first line creates a folder `~/.cfg` which is a Git bare repository that will track our files.
- Then we create an alias config which we will use instead of the regular git when we want to interact with our configuration repository.
- We set a flag - local to the repository - to hide files we are not explicitly tracking yet. This is so that when you type config status and other commands later, files you are not interested in tracking will not show up as untracked.
- Also you can add the alias definition by hand to your `.zshrc` or use the the fourth line provided for convenience.

After you've executed the setup any file within the `$HOME` folder can be versioned with normal commands, replacing git with your newly created config alias, like:

    config status
    config add ~/.config/nvim
    config commit -m "Add nvim"
    config add .zshrc
    config commit -m "Add zshrc"
    config push

## Installing your dotfiles onto a new system (or migrate to this setup)

If you already store your configuration/dotfiles in a Git repository, on a new system you can migrate to this setup with the following steps:

- Prior to the installation make sure you have committed the alias to your `.bashrc` or `.zsh`:
  
      alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

- And that your source repository ignores the folder where you'll clone it, so that you don't create weird recursion problems:

      echo ".cfg" >> .gitignore

- Now clone your dotfiles into a bare repository in a "dot" folder of your `$HOME`:
  
      git clone --bare <git-repo-url> $HOME/.cfg

- Define the alias in the current shell scope:

      alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

- Checkout the actual content from the bare repository to your `$HOME`:

      config checkout

- The step above might fail with a message like:
  
        error: The following untracked working tree files would be overwritten by checkout:
               .bashrc (or .zshrc)
               .gitignore
        Please move or remove them before you can switch branches.
        Aborting

This is because your `$HOME` folder might already have some stock configuration files which would be overwritten by Git. The solution is simple: back up the files if you care about them, remove them if you don't care. I provide you with a possible rough shortcut to move all the offending files automatically to a backup folder:

    mkdir -p .config-backup && \
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
    xargs -I{} mv {} .config-backup/{}

- Re-run the check out if you had problems:

      config checkout

- Set the flag showUntrackedFiles to no on this specific (local) repository:

      config config --local status.showUntrackedFiles no

- You're done, from now on you can now type config commands to add and update your dotfiles:

      config status
      config add ~/.config/nvim
      config commit -m "Add nvim"
      config add .zshrc
      config commit -m "Add zshrc"
      config push

Again as a shortcut not to have to remember all these steps on any new machine you want to setup, you can create a simple script like this:

    git clone --bare <git-repo-url> $HOME/.cfg
    function config {
       /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
    }
    mkdir -p .config-backup
    config checkout
    if [ $? = 0 ]; then
      echo "Checked out config.";
    else
      echo "Backing up pre-existing dot files.";
      config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
    fi;
    config checkout
    config config status.showUntrackedFiles no

## Wrapping up

I hope you find this technique useful to track your configuration. If you're curious, my dotfiles live here. Also please do stay connected by following [@drone076](https://github.com/drone076).
