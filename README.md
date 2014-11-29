# simple-vim-shell

This is a minimal vim plugin for executing shell commands from vim. All it does is create a single
new mapping for `!`, which opens a command line window for shell commands. Each command you execute
in this way is executed in a new session (just like `:!<your command here>`) so it's not a
replacement for a real shell. It's just a nicer way to execute `:!` commands.

I expect that doing this opens up a bunch of vulnerabilities, and I've made absolutely no attempt to
prevent that. If anyone other that you uses your computer you probably shouldn't use this plugin.

