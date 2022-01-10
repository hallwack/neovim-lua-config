local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local cmd = vim.cmd

-- nvim-tree
map('n', '<C-b>', ':NvimTreeToggle<CR>', default_opts     ) -- open/close
map('i', 'jj', '<Esc>', default_opts)
map('v', 'aa', '<Esc>', default_opts)
map('n', '<C-h>', '<C-w>h', default_opts)
map('n', '<C-l>', '<C-w>l', default_opts)
map('n', '<C-j>', '<C-w>j', default_opts)
map('n', '<C-k>', '<C-w>k', default_opts)
map('n', '<leader>f', "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown())<cr>", default_opts)
map('n', '<leader>gr', "<cmd>lua require('telescope.builtin').live_grep(require('telescope.themes').get_dropdown())<cr>", default_opts)
