require("git"):setup {
	-- Order of status signs showing in the linemode
	order = 1500,
}
require("full-border"):setup {
	-- Available values: ui.Border.PLAIN, ui.Border.ROUNDED
	type = ui.Border.ROUNDED,
}
require("no-status"):setup()
require("no-header"):setup()
require("clear-filter"):setup()
