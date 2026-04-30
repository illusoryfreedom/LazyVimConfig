return {
  "debugloop/telescope-undo.nvim",
  dependencies = { -- This ensures telescope is loaded first
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { -- Use <leader>su (Search Undo) to open the browser
      "<leader>su",
      "<cmd>Telescope undo<cr>",
      desc = "Undo history",
    },
  },
  opts = {
    -- This section is where you can customize the behavior
    extensions = {
      undo = {
        side_by_side = true,
        layout_strategy = "vertical",
        layout_config = {
          preview_height = 0.8,
        },
      },
    },
  },
  config = function(_, opts)
    -- This tells telescope to actually load the undo extension
    require("telescope").setup(opts)
    require("telescope").load_extension("undo")
  end,
}
