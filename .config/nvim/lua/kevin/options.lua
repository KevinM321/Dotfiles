vim.opt.guicursor = ''

vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.swapfile = false
vim.opt.undofile = true

vim.opt.showcmd = false
vim.opt.showmode = false
vim.opt.shortmess:append('S')

vim.opt.wrap = false
vim.opt.textwidth = 80
vim.opt.colorcolumn = '+1'

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.foldlevel = 99
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

vim.opt.spell = true
vim.opt.spelllang = 'en,cjk'

vim.keymap.set('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>a', { noremap = true, silent = true })
vim.keymap.set('v', '<C-s>', '<Esc>:w<CR>gv', { noremap = true, silent = true })
