(module dotfiles.plugin.kanagawa
  {autoload {: kanagawa}})

(kanagawa.setup {:dimInactive true})

(vim.cmd "colorscheme kanagawa")
