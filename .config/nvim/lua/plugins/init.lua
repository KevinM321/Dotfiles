return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                transparent_background = true,
                custom_highlights = function(colors)
                    return {
                        LineNr = { fg = colors.pink},
                    }
                end
            })
            vim.cmd.colorscheme "catppuccin-mocha"
        end
    },
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate", -- optional, updates registry
        config = function()
            require("mason").setup()
        end
    },
    {
        'numToStr/Comment.nvim',
        config = function()
        require('Comment').setup()
        end
    }
}
