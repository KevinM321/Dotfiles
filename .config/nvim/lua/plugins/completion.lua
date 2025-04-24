return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-buffer',
        'L3MON4D3/LuaSnip'
    },

    config = function()
        local cmp = require'cmp'
        cmp.setup {
        sources = {
        { name = 'path' },
        { name = 'buffer' },
        },
        mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
    }
  end
}
