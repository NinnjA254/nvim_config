require('telescope').setup{
	defaults = {
		file_ignore_patterns = {
		--there has to be a better way of doing this. 
		--since ripgrep is installed, it ought to ignore 
		--them shits by default but this does not work on windows. What gives?
			{"node_modules"} 
		}
	}
}
