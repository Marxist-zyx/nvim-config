return {
	{
		"lervag/vimtex",
		lazy = false, -- we don't want to lazy load VimTeX
		-- tag = "v2.15", -- uncomment to pin to a specific release
		-- VimTeX configuration goes here, e.g.
		config = function()
			vim.g.vimtex_view_general_viewer = "SumatraPDF"
			vim.g.vimtex_view_general_options = " -reuse-instance -forward-search @tex @line @pdf"
		end,
	},
}
