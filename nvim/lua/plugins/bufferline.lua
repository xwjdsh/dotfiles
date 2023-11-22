vim.opt.termguicolors = true
require("bufferline").setup {
    highlights = require("catppuccin.groups.integrations.bufferline").get(),
    options = {
       indicator = {
         icon = '🌈',
         style = 'icon',
       },
       offsets = {{
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left",
            separator = true
       }}
    }
}
