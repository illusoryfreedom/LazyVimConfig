return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    opts.options = opts.options or {}
    opts.options.theme = {
      normal   = { a = { bg = "NONE", fg = "#f8f8f2", gui = "bold" }, b = { bg = "NONE", fg = "#f8f8f2" }, c = { bg = "NONE", fg = "#f8f8f2" } },
      insert   = { a = { bg = "NONE", fg = "#50fa7b", gui = "bold" }, b = { bg = "NONE", fg = "#f8f8f2" }, c = { bg = "NONE", fg = "#f8f8f2" } },
      visual   = { a = { bg = "NONE", fg = "#ff79c6", gui = "bold" }, b = { bg = "NONE", fg = "#f8f8f2" }, c = { bg = "NONE", fg = "#f8f8f2" } },
      replace  = { a = { bg = "NONE", fg = "#ff5555", gui = "bold" }, b = { bg = "NONE", fg = "#f8f8f2" }, c = { bg = "NONE", fg = "#f8f8f2" } },
      command  = { a = { bg = "NONE", fg = "#ffb86c", gui = "bold" }, b = { bg = "NONE", fg = "#f8f8f2" }, c = { bg = "NONE", fg = "#f8f8f2" } },
      inactive = { a = { bg = "NONE", fg = "#6272a4", gui = "bold" }, b = { bg = "NONE", fg = "#6272a4" }, c = { bg = "NONE", fg = "#6272a4" } },
    }
    return opts
  end,
}
