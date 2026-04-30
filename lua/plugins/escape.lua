return {
  "max397574/better-escape.nvim",
  config = function()
    require("better_escape").setup({
      mapping = { "jj" }, -- The keys you want to use
      timeout = 200, -- The time window in ms
    })
  end,
}
