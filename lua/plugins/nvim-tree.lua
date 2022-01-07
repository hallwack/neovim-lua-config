local g = vim.g

-- g.nvim_tree_indent_markers = 1
g.nvim_tree_highlight_opened_files = 1
g.nvim_tree_show_icons = {git = 1, folders = 1, files = 1}

vim.g.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    unstaged = "",
    staged = "S",
    unmerged = "",
    renamed = "➜",
    deleted = "",
    untracked = "U",
    ignored = "◌",
  },
  folder = {
    default = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = "",
  },
}

require('nvim-tree').setup {
  update_cwd = true,
  view = { width = 32, auto_resize = true, side = "right" },
  filters = {
    dotfiles = true,
    custom = { '.git', 'node_modules', '.cache', '.bin' }
  },
  git = { enable = true, ignore = true }
}
