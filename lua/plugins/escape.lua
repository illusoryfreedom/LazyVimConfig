return {
  "max397574/better-escape.nvim",
  opts = {
    timeout = 300,
    default_mappings = false, -- Set to true if you want the default 'jk'
    mappings = {
      i = {
        j = {
          k = "<Esc>",
          j = "<Esc>",
        },
      },
      c = {
        j = {
          k = "<Esc>",
        },
      },
      t = {
        j = {
          k = "<C-\\><C-n>",
        },
      },
      v = {
        j = {
          k = "<Esc>",
        },
      },
      s = {
        j = {
          k = "<Esc>",
        },
      },
    },
  },
}
