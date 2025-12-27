# ⚙️ Dotfiles Management (Bare Git Repository)

This repository uses the "Bare Repository" method to manage dotfiles without cluttering the `$HOME` directory with a `.git` folder.

## 🚀 Setup on a New Machine

Follow these steps to clone and deploy these dotfiles onto a new laptop:

### 1. Clone the repository
Clone the repo as a bare directory into a hidden folder (e.g., `.cfg`) and use a temporary folder for the initial checkout:

```bash
git clone --separate-git-dir=$HOME/.cfg https://github.com/stefanomuraro/dotfiles.git dotfiles-tmp

```

### 2. Set up the Alias

Add this alias to your current shell (and make sure to add it to your `.zshrc` or `.bashrc` for persistence):

```bash
alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

```

### 3. Deploy files to $HOME

Sync the files from the temporary folder to your home directory and then remove the temp folder:

```bash
rsync --recursive --verbose --exclude '.git' dotfiles-tmp/ $HOME/
rm -rf dotfiles-tmp

```

### 4. Final Configuration

Ensure that `cfg status` only shows files explicitly tracked in the repository:

```bash
cfg config --local status.showUntrackedFiles no

```

---

## 🛠️ Usage & Workflow

Use the `cfg` command exactly as you would use `git`:

* **Check status:** `cfg status`
* **Add changes:** `cfg add .zshrc`
* **Force add (if ignored):** `cfg add -f .path/to/ignored_file`
* **Commit changes:** `cfg commit -m "Update aliases"`
* **Push updates:** `cfg push`
* **Pull updates:** `cfg pull`

---

## 📚 Resources

### General information on how to manage dotfiles

* [Your unofficial guide to dotfiles on GitHub](http://dotfiles.github.io/)

### Tutorials on managing dotfiles with a bare repository

* [Git Bare Repository - A Better Way To Manage Dotfiles](https://youtu.be/tBoLDpTWVOM)
* [Dotfiles: Best way to store in a bare git repository](https://www.atlassian.com/git/tutorials/dotfiles)