(module dotfiles.plugin.kanagawa
  {autoload {: kanagawa}})

(kanagawa.setup {})

(vim.cmd "colorscheme kanagawa")
