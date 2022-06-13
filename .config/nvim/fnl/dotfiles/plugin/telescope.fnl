(module dotfiles.plugin.telescope
  {autoload {ts telescope
             tsb telescope.builtin
             tst telescope.themes}})

(ts.load_extension :luasnip)
(ts.setup {:pickers {:find_files {:find_command [:fd
                                                 :--type :f
                                                 :--strip-cwd-prefix]}}})

;; Must be called after setup.
(ts.load_extension :ui-select)

(let [map (partial vim.keymap.set :n)]
  (map :<leader>ff tsb.find_files)
  (map :<leader>fb tsb.buffers)
  (map :<leader>fg tsb.live_grep)
  (map :<leader>fss tsb.spell_suggest)
  (map :<leader>fd tsb.diagnostics))
