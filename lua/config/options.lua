-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Enable line wrapping (no horizontal scrolling)
vim.opt.wrap = true

-- Optional: Better navigation for wrapped lines
-- This makes 'j' and 'k' move by visual lines instead of logical lines
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

vim.opt.textwidth = 1000 -- Change this to 0 to disable native wrapping entirely

-- vim.opt.clipboard = "" -- Don't copy and paste.

vim.o.smartcase = false
vim.o.ignorecase = false

vim.g.autoformat = false

vim.o.mousescroll = "ver:3,hor:0"
