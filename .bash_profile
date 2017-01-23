export GOPATH=$HOME/go

export PATH="$HOME/bin:/usr/local/bin:~/.composer/vendor/bin:/usr/local/sbin:/usr/local/opt/go/libexec/bin:/Applications/Atlassian/atlassian-plugin-sdk-6.2.4/bin:$GOPATH/bin:/Users/pierre/Library/Android/sdk/platform-tools:/Users/pierre/Library/Android/sdk/tools:$PATH"
export EDITOR=nano

export HOMEBREW_GITHUB_API_TOKEN="0bf2686953eaa704a695cae9f2f8b5a9f6aa1b85"
export DYLD_LIBRARY_PATH=/usr/lib/oracle64/
export GOROOT=/usr/local/opt/go/libexec

export JAVA_HOME=$(/usr/libexec/java_home)

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;

#source symfony2-autocomplete.bash
export LC_CTYPE="en_US.UTF-8"

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh;


if [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
fi

if which brew > /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
	source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
	complete -o default -o nospace -F _git g;
fi;

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults;

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;

for file in ~/.{bash_prompt,functions,aliases,git-completion,ssh-completion,symfony2-autocomplete}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

source $HOME/.completion/minikube

source $HOME/.phpbrew/bashrc
source $HOME/.oh-my-git/prompt.sh

eval "$(hub alias -s)"

# The next line updates PATH for the Google Cloud SDK.
source $HOME/google-cloud-sdk/path.bash.inc

# The next line enables shell command completion for gcloud.
source $HOME/google-cloud-sdk/completion.bash.inc
source $HOME/z.sh

#eval $(docker-machine env csbill-io)

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
