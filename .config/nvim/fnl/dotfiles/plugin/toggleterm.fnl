(module dotfiles.plugin.toggleterm
  {autoload {: toggleterm}}) 

(toggleterm.setup {:open_mapping :<C-\>
                   :direction :float
                   :float_opts {:border :curved}})

(let [map (partial vim.keymap.set :t)]
  (map :<Esc> :<C-\><C-n>))
