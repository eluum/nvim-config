require('plugins')
require('lsp')

-- search --
vim.opt.hlsearch = true

-- formatting --
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = false
vim.opt.mouse = 'a'
vim.opt.formatoptions:remove({'c', 'r', 'o'})
vim.opt.number = true

vim.keymap.set('i', '<Insert>', '<Nop>')
vim.keymap.set('i', '<S-Insert>', '<Insert>')

vim.opt.backspace = {'indent', 'eol', 'start'}
vim.opt.ruler = true
vim.opt.suffixes:append({'.aux', '.bbl', '.blg', '.brf', '.cb', '.dvi', '.idx', '.ilg', '.ind', '.inx', '.jpg', '.log', '.out', '.png', '.toc'})
vim.opt.suffixes:remove({'.h', '.obj'})

vim.opt.termguicolors = true

-- keybindings -- 
vim.g.mapleader = ' '
local opts = { silent = true }

-- window commands
vim.keymap.set('n', '<leader>h', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<leader>j', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<leader>k', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<leader>l', ':wincmd l<CR>', opts)
vim.keymap.set('n', '<leader>q', ':wincmd q<CR>', opts)
vim.keymap.set('n', '<leader>Q', ':q!<CR>', opts)

-- faster splitting
vim.keymap.set('n', '<leader>H', ':wincmd v<bar>wincmd h<CR>', opts)
vim.keymap.set('n', '<leader>L', ':wincmd v<CR>:wincmd l<CR>', opts)
vim.keymap.set('n', '<leader>J', ':wincmd s<bar>wincmd j<CR>', opts)
vim.keymap.set('n', '<leader>K', ':wincmd s<CR>:wincmd k<CR>', opts)

-- file explorer
vim.keymap.set('n', '<leader>e', ':Vexplore!<CR>', opts)
vim.keymap.set('n', '<leader>E', ':Ex<CR>', opts)
vim.keymap.set('n', '<leader>t', ':Texplore<CR>', opts)
vim.keymap.set('n', '-', ':Ex<CR>', opts)
vim.g.netrw_banner = 0

-- terminal
vim.keymap.set('n', '<leader>;', ':bot split<bar>resize 20<bar>terminal<CR>i', opts)
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', opts)
vim.keymap.set('t', '<C-q>', '<C-\\><C-n>:bd!<CR>', opts)

-- misc
vim.keymap.set('n', '<leader>\\', ':noh<CR>', opts)
vim.keymap.set('n', '<tab>', 'I<tab><esc>', opts)
vim.keymap.set('n', '<s-tab>', 'I<backspace><esc>', opts)
vim.keymap.set('n', '<leader>=', 'ggVG=\'\'', opts)

-- copy paste
vim.keymap.set('n', '<leader>p', '"0p', opts)
vim.keymap.set('v', '<leader>p', '"0p', opts)
vim.keymap.set('n', '<leader>P', '"+p', opts)
vim.keymap.set('v', '<leader>P', '"+p', opts)
vim.keymap.set('n', '<C-V>P', '"+p', opts)
vim.keymap.set('v', '<C-V>P', '"+p', opts)

-- language specific settings --

-- text editing
vim.api.nvim_create_autocmd('FileType', {
    pattern = {'text', 'markdown'},
    callback = function()
        vim.opt_local.wrap = true 
        vim.opt_local.linebreak = true 
        vim.opt_local.spell = true
    end
})

-- gleam formatting
vim.api.nvim_create_autocmd('FileType', {
    pattern = {'gleam'},
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
    end
})

-- setup colorscheme --
require('colormemory').setup('default', 'dark')
