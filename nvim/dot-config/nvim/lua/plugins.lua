-- Bootstrap packer.nvim
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- load plugins --
require('packer').startup(function(use)
    -- functionality --
    use 'eluum/vim-autopair'
    use 'akinsho/bufferline.nvim'
    use 'neovim/nvim-lspconfig'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'nvim-treesitter/nvim-treesitter'

    -- color schemes --
    use 'morhetz/gruvbox'
    use 'vv9k/bogster'
    use {'catppuccin/nvim', as = 'catppuccin'}
    use 'rebelot/kanagawa.nvim'
    use 'savq/melange-nvim'
    use 'sainnhe/everforest'
    use 'shaunsingh/nord.nvim'
    use 'pineapplegiant/spaceduck'
    use 'ribru17/bamboo.nvim'
    use {'lifepillar/vim-solarized8', branch = 'neovim'}
    use 'loctvl842/monokai-pro.nvim'
    use 'NLKNguyen/papercolor-theme'
    use 'kyazdani42/nvim-web-devicons'
end)

-- configure plugins --

require("ibl").setup {
    whitespace = {
	    remove_blankline_trail = false
    },
    scope = {
        enabled = false
    }
}

require('bufferline').setup {
    options = {
        mode = "tabs",
        separator_style = "|",
    }
}

require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true
    }
}
