return {
  "folke/snacks.nvim",
  opts = function(_, opts)
    -- 1. Dashboard Configuration
    opts.dashboard = opts.dashboard or {}

    -- This disables the internal rendering scroll
    opts.dashboard.pane_configs = { scroll = false }

    -- This locks the window properties to prevent physical movement
    opts.dashboard.win = {
      style = "dashboard",
      wo = {
        scrolloff = 0,
        sidescrolloff = 0,
        statuscolumn = "",
        signcolumn = "no",
        modifiable = false,
        wrap = false,
      },
    }

    -- 2. Custom Header
    -- opts.dashboard.sections = {
    --   { section = "header", hl = "Keyword" }, -- "Keyword" is Dracula's pink/purple. Use "String" for Green or "Function" for Yellow.
    --   { section = "keys", gap = 1, padding = 1 },
    --   { section = "startup" },
    -- }
    opts.dashboard = opts.dashboard or {}
    opts.dashboard.sections = {
      { section = "header", hl = "String" }, -- Change "String" to "Keyword" or "Function" for different colors
      { section = "keys", gap = 1, padding = 1 },
      { section = "startup" },
    }
    opts.dashboard.preset.header_hl = "MyBannerColor"
    opts.dashboard.preset = opts.dashboard.preset or {}
    opts.dashboard.preset.header = [[
 ░▒▓█▓▒░      ░▒▓████████▓▒░▒▓████████▓▒░▒▓███████▓▒░      ░▒▓███████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░      ░▒▓███████▓▒░░▒▓█▓▒░ 
 ░▒▓█▓▒░      ░▒▓█▓▒░         ░▒▓█▓▒░  ░▒▓█▓▒░             ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░ 
 ░▒▓█▓▒░      ░▒▓█▓▒░         ░▒▓█▓▒░  ░▒▓█▓▒░             ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░ 
 ░▒▓█▓▒░      ░▒▓██████▓▒░    ░▒▓█▓▒░   ░▒▓██████▓▒░       ░▒▓███████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░ 
 ░▒▓█▓▒░      ░▒▓█▓▒░         ░▒▓█▓▒░          ░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░ 
 ░▒▓█▓▒░      ░▒▓█▓▒░         ░▒▓█▓▒░          ░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░       
 ░▒▓████████▓▒░▒▓████████▓▒░  ░▒▓█▓▒░  ░▒▓███████▓▒░       ░▒▓███████▓▒░ ░▒▓██████▓▒░░▒▓█▓▒░▒▓████████▓▒░▒▓███████▓▒░░▒▓█▓▒░ 
]]

    -- 3. Custom Keys
    opts.dashboard.preset.keys = opts.dashboard.preset.keys or {}
    table.insert(opts.dashboard.preset.keys, 5, {
      icon = " ",
      key = "b",
      desc = "Config Explorer",
      action = ":lua Snacks.explorer({ cwd = vim.fn.stdpath('config') })",
    })

    -- 4. Notifier Logic
    opts.notifier = {
      filter = function(notif)
        return not notif.msg:find("inlay_hint.lua")
      end,
    }

    -- 5. Explorer Logic
    opts.explorer = {
      layout = {
        position = "left",
        direction = "vertical",
        preset = "default",
        cycle = true,
      },
    }

    -- 6. Picker Logic
    opts.picker = {
      sources = {
        explorer = {
          layout = {
            preset = "sidebar",
            preview = "main",
          },
        },
      },
      layout = {
        cycle = true,
        preset = "default",
      },
      win = {
        input = {
          keys = {
            ["<Tab>"] = { "preview", mode = { "i", "n" } },
          },
        },
      },
    }
  end,
}
