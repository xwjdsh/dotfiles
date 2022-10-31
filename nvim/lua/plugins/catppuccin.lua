require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    transparent_background = true,
    custom_highlights = {
      indicator = {
        style = 'underline'
      },
    }
})

-- color schema
vim.cmd[[colorscheme catppuccin]]
