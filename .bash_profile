export PATH=~/bin:/usr/local/bin:/usr/local/mysql/bin:~/Documents/android-sdk-macosx/platform-tools:~/Documents/android-sdk-macosx/tools:~/Documents/dart/dart-sdk/bin:~/.composer/vendor/bin:$PATH
export EDITOR=nano

# MacPorts Installer addition on 2012-08-22_at_21:14:59: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

source symfony2-autocomplete.bash
export LC_CTYPE="en_US.UTF-8"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh;


for file in ~/.{bash_prompt,aliases,git-completion,ssh-completion,gush-autocomplete}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;
