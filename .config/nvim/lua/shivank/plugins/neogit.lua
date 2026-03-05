return {
	"NeogitOrg/neogit",
	lazy = true,
	dependencies = {
		"nvim-lua/plenary.nvim", -- required

		-- Only one of these is needed.
		"esmuellert/codediff.nvim", -- optional
		"https://github.com/isakbm/gitgraph.nvim",
	},
	cmd = "Neogit",
	keys = {
		{ "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" },
        { "<leader>gl", "<cmd>Neogit log<cr>", desc = "Show Neogit UI" }, },
	config = function()
		require("neogit").setup({
			disable_hint = true,
			-- Disables changing the buffer highlights based on where the cursor is.
			disable_context_highlighting = true,
			-- Disables signs for sections/items/hunks
			disable_signs = false,
			-- Path to git executable. Defaults to "git". Can be used to specify a custom git binary or wrapper script.
			git_executable = "git",
			-- Offer to force push when branches diverge
			prompt_force_push = true,
			-- Request confirmation when amending already published commits
			prompt_amend_commit = true,
			-- Changes what mode the Commit Editor starts in. `true` will leave nvim in normal mode, `false` will change nvim to
			-- insert mode, and `"auto"` will change nvim to insert mode IF the commit message is empty, otherwise leaving it in
			-- normal mode.
			disable_insert_on_commit = true,
			graph_style = "kitty",
			process_spinner = false,
			-- Used to generate URL's for branch popup action "pull request", "open commit" and "open tree"
			git_services = {
				["github.com"] = {
					pull_request = "https://github.com/${owner}/${repository}/compare/${branch_name}?expand=1",
					commit = "https://github.com/${owner}/${repository}/commit/${oid}",
					tree = "https://${host}/${owner}/${repository}/tree/${branch_name}",
				},
			},
			-- Value used for `--sort` option for `git branch` command
			-- By default, branches will be sorted by commit date descending
			-- Flag description: https://git-scm.com/docs/git-branch#Documentation/git-branch.txt---sortltkeygt
			-- Sorting keys: https://git-scm.com/docs/git-for-each-ref#_options
			sort_branches = "-committerdate",
			-- Value passed to the `--<commit_order>-order` flag of the `git log` command
			-- Determines how commits are traversed and displayed in the log / graph:
			--   "topo"         topological order (parents always before children, good for graphs, slower on large repos)
			--   "date"         chronological order by commit date
			--   "author-date"  chronological order by author date
			--   ""             disable explicit ordering (fastest, recommended for very large repos)
			commit_order = "topo",
			-- Default for new branch name prompts
			initial_branch_name = "",
			-- Default for rename branch prompt. If not set, the current branch name is used
			initial_branch_rename = nil,
			-- Change the default way of opening neogit
			kind = "auto",
			-- Floating window style
			floating = {
				relative = "editor",
				width = 0.8,
				height = 0.7,
				style = "minimal",
				border = "rounded",
			},
			-- Disable line numbers
			disable_line_numbers = true,
			-- Disable relative line numbers
			disable_relative_line_numbers = true,
			-- The time after which an output console is shown for slow running commands
			console_timeout = 2000,
			-- Automatically show console if a command takes more than console_timeout milliseconds
			auto_show_console = true,
			-- Automatically close the console if the process exits with a 0 (success) status
			auto_close_console = true,
			notification_icon = "󰊢",
			status = {
				show_head_commit_hash = true,
				recent_commit_count = 20,
			},
			commit_editor = {
				kind = "auto",
				show_staged_diff = true,
				-- Accepted values:
				-- "split" to show the staged diff below the commit editor
				-- "vsplit" to show it to the right
				-- "split_above" Like :top split
				-- "vsplit_left" like :vsplit, but open to the left
				-- "auto" "vsplit" if window would have 80 cols, otherwise "split"
				staged_diff_split_kind = "split",
				spell_check = true,
			},
			commit_select_view = {
				kind = "auto",
			},
			commit_view = {
				kind = "vsplit",
				verify_commit = vim.fn.executable("gpg") == 1, -- Can be set to true or false, otherwise we try to find the binary
			},
			log_view = {
				kind = "auto",
			},
			rebase_editor = {
				kind = "auto",
			},
			reflog_view = {
				kind = "auto",
			},
			merge_editor = {
				kind = "auto",
			},
			preview_buffer = {
				kind = "floating_console",
			},
			popup = {
				kind = "auto",
			},
			stash = {
				kind = "auto",
			},
			refs_view = {
				kind = "auto",
			},
			signs = {
				-- { CLOSED, OPENED }
				hunk = { "", "" },
				item = { "", "" },
				section = { " ", " " },
			},
			-- Each Integration is auto-detected through plugin presence, however, it can be disabled by setting to `false`
			integrations = {
				codediff = true,
				fzf_lua = true,
			},
			-- Which diff viewer to use. nil = auto-detect (tries diffview first, then codediff).
			-- Can be "diffview" or "codediff".
			diff_viewer = nil,
			sections = {
				-- Reverting/Cherry Picking
				sequencer = {
					folded = false,
					hidden = false,
				},
				untracked = {
					folded = false,
					hidden = false,
				},
				unstaged = {
					folded = false,
					hidden = false,
				},
				staged = {
					folded = false,
					hidden = false,
				},
				stashes = {
					folded = true,
					hidden = false,
				},
				unpulled_upstream = {
					folded = true,
					hidden = false,
				},
				unmerged_upstream = {
					folded = false,
					hidden = false,
				},
				unpulled_pushRemote = {
					folded = true,
					hidden = false,
				},
				unmerged_pushRemote = {
					folded = false,
					hidden = false,
				},
				recent = {
					folded = false,
					hidden = false,
				},
				rebase = {
					folded = true,
					hidden = false,
				},
			},
			mappings = {
				commit_editor = {
					["q"] = "Close",
					["<c-c><c-c>"] = "Submit",
					["<c-c><c-k>"] = "Abort",
					["<m-p>"] = "PrevMessage",
					["<m-n>"] = "NextMessage",
					["<m-r>"] = "ResetMessage",
				},
				commit_editor_I = {
					["<c-c><c-c>"] = "Submit",
					["<c-c><c-k>"] = "Abort",
				},
				rebase_editor = {
					["p"] = "Pick",
					["r"] = "Reword",
					["e"] = "Edit",
					["s"] = "Squash",
					["f"] = "Fixup",
					["x"] = "Execute",
					["d"] = "Drop",
					["b"] = "Break",
					["q"] = "Close",
					["<cr>"] = "OpenCommit",
					["gk"] = "MoveUp",
					["gj"] = "MoveDown",
					["<c-c><c-c>"] = "Submit",
					["<c-c><c-k>"] = "Abort",
					["[c"] = "OpenOrScrollUp",
					["]c"] = "OpenOrScrollDown",
				},
				rebase_editor_I = {
					["<c-c><c-c>"] = "Submit",
					["<c-c><c-k>"] = "Abort",
				},
				finder = {
					["<cr>"] = "Select",
					["<c-c>"] = "Close",
					["<esc>"] = "Close",
					["<c-n>"] = "Next",
					["<c-p>"] = "Previous",
					["<down>"] = "Next",
					["<up>"] = "Previous",
					["<tab>"] = "InsertCompletion",
					["<c-y>"] = "CopySelection",
					["<space>"] = "MultiselectToggleNext",
					["<s-space>"] = "MultiselectTogglePrevious",
					["<c-j>"] = "NOP",
					["<ScrollWheelDown>"] = "ScrollWheelDown",
					["<ScrollWheelUp>"] = "ScrollWheelUp",
					["<ScrollWheelLeft>"] = "NOP",
					["<ScrollWheelRight>"] = "NOP",
					["<LeftMouse>"] = "MouseClick",
					["<2-LeftMouse>"] = "NOP",
				},
				-- Setting any of these to `false` will disable the mapping.
				popup = {
					["?"] = "HelpPopup",
					["A"] = "CherryPickPopup",
					["d"] = "DiffPopup",
					["M"] = "RemotePopup",
					["P"] = "PushPopup",
					["X"] = "ResetPopup",
					["Z"] = "StashPopup",
					["i"] = "IgnorePopup",
					["t"] = "TagPopup",
					["b"] = "BranchPopup",
					["B"] = "BisectPopup",
					["w"] = "WorktreePopup",
					["c"] = "CommitPopup",
					["f"] = "FetchPopup",
					["l"] = "LogPopup",
					["m"] = "MergePopup",
					["p"] = "PullPopup",
					["r"] = "RebasePopup",
					["v"] = "RevertPopup",
				},
				status = {
					["j"] = "MoveDown",
					["k"] = "MoveUp",
					["o"] = "OpenTree",
					["q"] = "Close",
					["ZZ"] = "Close",
					["I"] = "InitRepo",
					["1"] = "Depth1",
					["2"] = "Depth2",
					["3"] = "Depth3",
					["4"] = "Depth4",
					["Q"] = "Command",
					["<tab>"] = "Toggle",
					["za"] = "Toggle",
					["zo"] = "OpenFold",
					["x"] = "Discard",
					["s"] = "Stage",
					["S"] = "StageUnstaged",
					["<c-s>"] = "StageAll",
					["u"] = "Unstage",
					["K"] = "Untrack",
					["U"] = "UnstageStaged",
					["y"] = "ShowRefs",
					["$"] = "CommandHistory",
					["Y"] = "YankSelected",
					["gp"] = "GoToParentRepo",
					["<c-r>"] = "RefreshBuffer",
					["<cr>"] = "GoToFile",
					["<s-cr>"] = "PeekFile",
					["<c-v>"] = "VSplitOpen",
					["<c-x>"] = "SplitOpen",
					["<c-t>"] = "TabOpen",
					["{"] = "GoToPreviousHunkHeader",
					["}"] = "GoToNextHunkHeader",
					["[c"] = "OpenOrScrollUp",
					["]c"] = "OpenOrScrollDown",
					["<c-k>"] = "PeekUp",
					["<c-j>"] = "PeekDown",
					["<c-n>"] = "NextSection",
					["<c-p>"] = "PreviousSection",
				},
			},
		})
	end,
}
