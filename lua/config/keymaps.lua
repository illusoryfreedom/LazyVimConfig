-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Add this to ~/.config/nvim/lua/config/keymaps.lua
vim.keymap.set("v", "<leader>sopl", [[cSystem.out.println(<c-r>");<esc>]], { desc = "Java Print Selection" })
-- vim.api.nvim_buf_set_keymap(0, "v", "<leader>n", [[cSystem.out.println(<c-r>");<esc>]], { noremap = false })
-- vim.keymap.set("i", "jj", "<Esc>", { desc = "Exit insert mode" })
-- vim.keymap.set({ "n", "i", "v", "c" }, "cc", "<Esc>", { desc = "Exit to Normal mode" })
-- Shift + Enter for new line in insert mode
vim.keymap.set("i", "<S-CR>", "<Esc>o", { desc = "Newline below in insert mode" })

-- Create undo breakpoints for specific characters
-- vim.keymap.set("i", ",", ",<c-g>u")
-- vim.keymap.set("i", ".", ".<c-g>u")
-- vim.keymap.set("i", ";", ";<c-g>u")
-- vim.keymap.set("i", "<cr>", "<cr><c-g>u")

vim.keymap.set("n", "i", function()
  if #vim.fn.getline(".") == 0 then
    return [["_cc]]
  else
    return "i"
  end
end, { expr = true, desc = "Indent empty line on insert" })

-- Yank to system clipboard and then cut (delete)
vim.keymap.set("v", "xy", '"+ygvde', { desc = "Yank to system clipboard and then cut (delete)" })

-- Force floating neo-tree regardless of global settings
-- vim.keymap.set("n", "<leader>fe", function()
--   vim.cmd("Neotree float reveal=true")
-- end, { desc = "Explorer NeoTree (Float)" })

-- Redirect Space + e to the existing Tab menu
-- vim.keymap.set("n", "<leader>e", "<leader><tab>", {
--   remap = true,
--   desc = "Tabs",
-- })

-- Map Space + f + e to a floating Neo-tree window
-- vim.keymap.set("n", "<leader>fe", "<cmd>Neotree float<cr>", {
--   desc = "Explorer NeoTree (Floating)",
-- })

-- 1. Explicitly set Space + e to its default behavior (Sidebar Explorer)
-- This ensures it stays "Root Dir" explorer and doesn't get confused
-- vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", {
--   desc = "Explorer NeoTree (Root Dir)",
-- })

-- Optional: Remove the original Space + Tab mapping
-- vim.keymap.del("n", "<leader><tab>")

-- 1. Disable 'x' and 'X' in Normal Mode so they do nothing
-- vim.keymap.set("n", "x", "<nop>", { desc = "Disabled x" })
vim.keymap.set("n", "X", "<nop>", { desc = "Disabled X" })

-- 2. Disable 'x' in Visual Mode
vim.keymap.set("v", "x", "<nop>", { desc = "Disabled x in visual" })

-- 3. Map 'X' in Visual Mode to cut the copying
-- In Neovim, "d" is the internal command for cut (delete to register)
vim.keymap.set("v", "X", "d", { desc = "Cut selection with X" })

-- Normal Mode: Delete without copying
vim.keymap.set("n", "d", '"_d', { desc = "Delete without copying" })
vim.keymap.set("n", "dd", '"_dd', { desc = "Delete line without copying" })
vim.keymap.set("n", "D", '"_D', { desc = "Delete to end of line without copying" })

-- Visual Mode: Delete selection without copying
vim.keymap.set("v", "d", '"_d', { desc = "Delete selection without copying" })

-- Optional: If you want 'c' (change) to also stop copying
vim.keymap.set({ "n", "v" }, "c", '"_c', { desc = "Change without copying" })

-- 1. Disable the 'c' operator in Normal and Visual modes
-- This kills 'cw', 'ciw', 'c$', etc.
vim.keymap.set({ "n", "v" }, "c", "<nop>", { desc = "Disabled c operator" })

-- 2. Disable the shorthand 'C' (change to end of line)
vim.keymap.set({ "n", "v" }, "C", "c", { desc = "Disabled C" })

-- 3. Disable 'cc' (change current line)
vim.keymap.set("n", "cc", "<nop>", { desc = "Disabled cc" })

-- 4. Disable 's' and 'S'
-- (Vim defaults these to 'cl' and 'cc', which are change commands)
vim.keymap.set({ "n", "v" }, "s", "<nop>", { desc = "Disabled s" })
vim.keymap.set({ "n", "v" }, "S", "<nop>", { desc = "Disabled S" })

-- Delete word forward (Normal Mode)
vim.keymap.set("n", "<C-Del>", "de", { noremap = true, silent = true })

-- Delete character (Normal Mode)
-- We use 'cl' then 'Esc' or just 'x'
vim.keymap.set("n", "<Del>", "x", { noremap = true, silent = true })

-- If <C-Del> doesn't work, try mapping the common escape sequence
vim.keymap.set("n", "<C-Delete>", "de", { noremap = true })
vim.keymap.set("i", "<C-Delete>", "<C-o>de", { noremap = true })

-- Delete next word (Normal Mode)
-- "dw" deletes from cursor to the start of the next word
-- vim.keymap.set("n", "<C-Del>", "dw", { desc = "Delete word ahead" })

-- Force Cmd + Backspace to do nothing in Insert Mode Cursor
vim.keymap.set("i", "<D-BS>", "<Nop>", { noremap = true, silent = true })

-- This forces a whole-word, case-sensitive search for the word under the cursor
vim.keymap.set(
  "n",
  "*",
  [[/\C\<]] .. vim.fn.expand("<cword>") .. [[\><CR>]],
  { desc = "Search word under cursor (Strict)" }
)

-- Paste instead of swapping.
vim.keymap.set("x", "p", [["_dP]])

-- Insert mode: Ctrl+Backspace and Ctrl+H to delete a word
vim.keymap.set("i", "<C-BS>", "<C-w>")
vim.keymap.set("i", "<C-H>", "<C-w>")

-- Command mode: Ctrl+Backspace and Ctrl+H to delete a word
vim.keymap.set("c", "<C-BS>", "<C-w>")
vim.keymap.set("c", "<C-H>", "<C-w>")

-- Make Delete key delete the character under the cursor (standard behavior)
vim.keymap.set("n", "<Del>", "x", { desc = "Delete character under cursor" })

-- Optional: Fix for Insert Mode as well
-- This makes Ctrl+Delete in Insert mode work like it does in Windows/macOS
vim.keymap.set("i", "<C-Del>", "<C-o>dw", { desc = "Delete word ahead in insert mode" })

-- Completely disable macro recording with q
vim.keymap.set("n", "q", "<Nop>", { silent = true, desc = "Disable macro recording" })
vim.keymap.set("n", "Q", "<Nop>", { silent = true, desc = "Disable macro recording (uppercase)" })

-- Find files in current directory only (depth 1)
vim.keymap.set("n", "<leader>f.", function()
  Snacks.picker.pick("files_shallow")
end, { desc = "Find Files (depth 1)" })

--hello
vim.keymap.set("n", "<leader>sd", function()
  vim.ui.input({ prompt = "Grep in directory: ", completion = "dir" }, function(dir)
    if dir then
      require("telescope.builtin").live_grep({ cwd = dir })
    end
  end)
end, { desc = "Live Grep in Specific Directory" })

-- Delete word forward in Insert Mode
vim.keymap.set("i", "<C-Del>", "<C-o>dw", { desc = "Delete word forward" })

-- Delete word forward in Command-line Mode
vim.keymap.set("c", "<C-Del>", "<C-f>dw<C-c>", { desc = "Delete word forward" })

-- Move whole lines up/down with <Tab>j and <Tab>k
vim.keymap.set("n", "<Tab>j", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move line(s) down" })

vim.keymap.set("n", "<Tab>k", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move line(s) up" })
