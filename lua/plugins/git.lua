return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- highly recommended for diffs
    "nvim-telescope/telescope.nvim", -- optional: for picking refs/branches
  },
  config = true,
  keys = {
    { "<leader>gs", "<cmd>Neogit<cr>", desc = "Neogit Status" },
  },
}
