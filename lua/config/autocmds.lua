-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
vim.opt.updatetime = 100

-- Disable horizontal scrolling in terminal.
vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-terminal-wrap", { clear = true }),
  callback = function()
    vim.opt_local.wrap = true
  end,
})

-- Fix undo command.
vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("UndoPersistFormat", { clear = true }),
  callback = function()
    -- This "undojoin" command forces the next change (formatting)
    -- to be part of the previous undo block.
    local status, err = pcall(vim.cmd.undojoin)
    if not status then
      -- If undojoin fails (e.g., no changes made), just continue
      return
    end
  end,
})
-- Disable auto-commenting on new lines
-- vim.api.nvim_create_autocmd("BufEnter", {
--   callback = function()
--     vim.opt.formatoptions:remove({ "c", "r", "o" })
--   end,
-- })

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp", "java", "javascript", "typescript", "rust" }, -- add your languages
  callback = function()
    -- Remove the 'O' flag from the specific comment types you want to ignore
    -- We are looking for the 'O' flag inside the :set comments string
    vim.opt_local.comments:remove({ "://", ":--" })

    -- Ensure 'r' and 'o' are still in formatoptions so the block logic works
    vim.opt_local.formatoptions:append("ro")
  end,
})


vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    if vim.bo.filetype == "snacks_dashboard" then
      vim.o.mousescroll = "ver:0,hor:0"
    end
  end,
})
vim.api.nvim_create_autocmd("BufLeave", {
  callback = function()
    if vim.bo.filetype == "snacks_dashboard" then
      vim.o.mousescroll = "ver:3,hor:0"
    end
  end,
})

vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  pattern = { "*" },
  command = "silent! wall",
  nested = true,
})

-- vim.api.nvim_create_autocmd({ "InsertLeave", "CursorHold" }, {
--   pattern = "*",
--   callback = function()
--     if vim.bo.modified and vim.bo.buftype == "" then
--       vim.cmd("silent! write")
--     end
--   end,
-- })
