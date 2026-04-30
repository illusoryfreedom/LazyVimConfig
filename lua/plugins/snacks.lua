return {
  "folke/snacks.nvim",
  opts = {
    notifier = {
      -- Filter out the annoying inlay hint out of range error
      filter = function(notif)
        return not notif.msg:find("inlay_hint.lua")
      end,
    },
    explorer = {
      -- This ensures the explorer uses a layout that puts the preview on the right
      layout = {
        position = "left",
        direction = "vertical",
        preset = "default", -- or "sidebar"
        cycle = true,
      },
    },
    picker = {
      sources = {
        explorer = {
          layout = {
            preset = "sidebar",
            preview = "main", -- Automatically previews in the main right-hand split
          },
        },
      },
      -- This affects the general picker behavior (including explorer)
      layout = {
        cycle = true,
        --- @type snacks.picker.layout.Config
        preset = "default", -- "default" usually puts preview on the right or top depending on width
      },
      win = {
        input = {
          keys = {
            -- This enables "auto-preview" on hover/cursor move
            ["<Tab>"] = { "preview", mode = { "i", "n" } },
          },
        },
      },
    },
  },
}
