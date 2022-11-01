vim.opt.termguicolors = true
require("bufferline").setup {
    highlights = require("catppuccin.groups.integrations.bufferline").get(),
    options = {
       indicator = {
         icon = '🌈',
         style = 'icon',
       },
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
       }}
    }
}
