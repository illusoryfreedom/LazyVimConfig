return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      pickers = {
        find_files = {
          -- This will show the full path of the directory you are searching in
          prompt_title = "Find Files (" .. vim.fn.getcwd() .. ")",
          -- Alternatively, ensure path_display shows what you need
          path_display = { "smart" },
        },
      },
    },
  },
}
