return {
  {
    'nvim-lualine/lualine.nvim', -- Fancier statusline
    config = function()
      -- Set lualine as statusline
      -- See `:help lualine.txt`
      require('lualine').setup {
        options = {
          icons_enabled = false,
          theme = 'onedark',
          component_separators = '|',
          section_separators = '',
        }
      }
    end
  },
  {
    'nanozuki/tabby.nvim',
    -- event = 'VimEnter',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('tabby').setup({
        option = {
          tab_name = {
            override = function(tabid)
              return require('tabcd').get_tab_name(vim.api.nvim_tabpage_get_number(tabid))
            end,
          },
        },
      })
    end,
  }
}
