vim.opt.termguicolors = true
local groups = require('bufferline.groups')
require("bufferline").setup {
    highlights = require("catppuccin.groups.integrations.bufferline").get(),
    options = {
       indicator = {
         icon = '🌈',
         style = 'icon',
       },
       diagnostics = "coc",
       numbers = function(opts)
         return string.format('%s%s', opts.raise(opts.id), opts.lower(opts.ordinal))
       end,
        -- 左侧让出 nvim-tree 的位置
       offsets = {{
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left",
            separator = true
       }},
       groups = {
          options = {
            toggle_hidden_on_enter = true,
          },
          items = {
            groups.builtin.ungrouped,
            {
              name = 'Tests',
              matcher = function(buf)
                return buf.name:match('%_test')
                  or buf.name:match('%Test')
                  or buf.name:match('%Tests')
                  or buf.name:match('%_spec')
              end,
            },
            {
              name = 'Docs',
              matcher = function(buf)
                return buf.name:match('%.md') or buf.name:match('%.tex')
              end,
            },
            {
              name = 'Dotfiles',
              matcher = function(buf)
                return buf.name:sub(1, 1) == '.'
              end,
            },
          },
        },
    }
}
