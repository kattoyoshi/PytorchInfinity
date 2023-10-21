git config --global --add safe.directory /home/$(whoami)/workspace
git config --global core.editor vim

pre-commit install
# Enable tab-completion for git
echo "source /usr/share/bash-completion/completions/git" >> ~/.bashrc
source /usr/share/bash-completion/completions/git
