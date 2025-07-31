-- set expandtab
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- set leader key
vim.g.mapleader = " "

-- enable line numbers by default
vim.opt.number = true
vim.opt.relativenumber = true

-- set the clipboard as the default register for all yank/paste operations
vim.opt.clipboard = 'unnamedplus'

-- set default color scheme
vim.cmd('colorscheme vscode')

-- set telescope keymaps
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })

-- set neo-tree keymap
vim.keymap.set('n', '<C-b>', function()
  vim.cmd('Neotree toggle')
end
)

