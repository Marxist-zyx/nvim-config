return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
-- or                              , branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' },
	  cmd = "Telescope",
	  keys = {
  		{ "<leader>ff", ":Telescope find_files<CR>", desc = "find files" },
        { "<leader>fg", ":Telescope live_grep<CR>", desc = "grep file" },
		{ "<leader>fb", ":Telescope buffers<CR>", desc = "buffers" },
		{ "<leader>fo", ":Telescope oldfiles<CR>", desc = "oldfiles" },
	},
    }
