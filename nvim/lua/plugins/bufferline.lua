vim.opt.termguicolors = true
require("bufferline").setup {
  highlights = require("catppuccin.groups.integrations.bufferline").get()
}

require("bufferline").setup {
    options = {
        numbers = "buffer_id",
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
