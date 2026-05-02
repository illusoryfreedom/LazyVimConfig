return {
  {
    "Mofiqul/dracula.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- 1. Define the overrides BEFORE loading the scheme
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "dracula",
        callback = function()
          -- Comprehensive list of groups to strip of background
          local groups = {
            -- Main UI
            "Normal",
            "NormalNC",
            "NormalFloat",
            "FloatBorder",
            "SignColumn",
            "LineNr",
            "CursorLineNr",
            "StatusLine",
            "StatusLineNC",
            "WinBar",
            "WinBarNC",
            -- Snacks.nvim (Explorer, Dashboard, Picker)
            "SnacksNormal",
            "SnacksNormalNC",
            "SnacksBackdrop",
            "SnacksWinBar",
            "SnacksWinBarNC",
            "SnacksInputNormal",
            -- Which-Key
            "WhichKey",
            "WhichKeyFloat",
            "WhichKeyNormalFloat",
            -- Telescope
            "TelescopeNormal",
            "TelescopeBorder",
            "TelescopePromptNormal",
            "TelescopePromptBorder",
            -- Trees/Sidebars
            "NvimTreeNormal",
            "NvimTreeNormalNC",
            "NeoTreeNormal",
            "NeoTreeNormalNC",

            -- Neovim UI Base
            "StatusLine",
            "StatusLineNC",
            "MsgArea", -- This handles the command line area at the very bottom
            "ModeMsg",
            "MsgArea", -- This is the space below the statusline
            "StatusLine", -- The statusline itself
            "StatusLineNC", -- Non-current statuslines
            "WinSeparator", -- The thin line between the editor and the bottom

            -- Lualine specific (The "sections" of the bar)
            "lualine_c_normal",
            "lualine_c_insert",
            "lualine_c_visual",
            "lualine_c_replace",
            "lualine_c_command",
            "lualine_c_inactive",
            "lualine_a_normal",
            "lualine_b_normal",
          }

          for _, group in ipairs(groups) do
            vim.api.nvim_set_hl(0, group, { bg = "NONE", ctermbg = "NONE" })
          end

          local all_highlights = vim.api.nvim_get_hl(0, {})

          for hl_name, _ in pairs(all_highlights) do
            if hl_name:find("lualine") or hl_name:find("StatusLine") or hl_name:find("MsgArea") then
              vim.api.nvim_set_hl(0, hl_name, { bg = "NONE", ctermbg = "NONE" })
            end
          end

          -- Force the message area (command line) specifically just in case
          vim.api.nvim_set_hl(0, "MsgArea", { bg = "NONE", ctermbg = "NONE" })

          -- Specific Glass Overrides
          -- We use 'blend' on NormalFloat if you want a slight tint,
          -- but bg="NONE" is usually safer for pure Ghostty blur.
          vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
          vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#6272a4", bg = "NONE" })

          -- Popup/Autocomplete menu
          -- Use a 6-digit hex and the 'blend' parameter
          vim.api.nvim_set_hl(0, "Pmenu", { bg = "#000000", blend = 33 })
          vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#44475A" })

          -- Visual Accents
          -- Remove the alpha '0A' and '60' from these hex codes
          vim.api.nvim_set_hl(0, "CursorLine", { bg = "#222222" }) -- Adjusted for visibility
          vim.api.nvim_set_hl(0, "Search", { bg = "#0c4872", fg = "#000000" })
          vim.api.nvim_set_hl(0, "Visual", { bg = "#1728ba" })

          -- Popup/Autocomplete menu (slightly opaque for readability)
          -- vim.api.nvim_set_hl(0, "Pmenu", { bg = "#00000055" })
          -- vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#44475A" })
          --
          -- -- Visual Accents
          -- vim.api.nvim_set_hl(0, "CursorLine", { bg = "#ffffff0A" })
          -- vim.api.nvim_set_hl(0, "Search", { bg = "#ff79c660", fg = "#000000" })
          -- vim.api.nvim_set_hl(0, "Visual", { bg = "#bd93f960" })
        end,
      })

      -- 2. Setup and Load
      require("dracula").setup({
        transparent_bg = true,
        italic_comment = true,
      })

      vim.cmd([[colorscheme dracula]])
      vim.api.nvim_set_hl(0, "MyBannerColor", { fg = "#50fa7b" })
    end,
  },
}
