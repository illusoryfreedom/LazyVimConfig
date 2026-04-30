return {
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    event = "BufReadPost", -- Load when opening a file
    opts = {
      -- Use Treesitter as the main provider; fall back to indent
      provider_selector = function(bufnr, filetype, buftype)
        return { "treesitter", "indent" }
      end,
    },
    config = function(_, opts)
      -- UFO needs these fold settings to work correctly
      vim.o.foldcolumn = "1" -- '0' is also fine if you don't want a column
      vim.o.foldlevel = 99 -- Using ufo provider need a large value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      require("ufo").setup(opts)
      
      -- Keymaps for UFO
      vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
      vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })
    end,
  },
}
