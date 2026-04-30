return {
  {
    "rmagatti/goto-preview",
    event = "LspAttach",
    opts = {},
    keys = {
      { "gpd", "<cmd>lua require('goto-preview').goto_preview_definition()<cr>", desc = "Preview Definition" },
      { "gpi", "<cmd>lua require('goto-preview').goto_preview_implementation()<cr>", desc = "Preview Implementation" },
    },
  },
  {
    "nvim-java/nvim-java",
    config = function()
      require("java").setup()
      vim.lsp.enable("jdtls")
    end,
  },
}
