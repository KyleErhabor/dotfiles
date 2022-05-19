(module dotfiles.plugin.telescope
  {autoload {ts telescope
             tsb telescope.builtin}})

(ts.load_extension :luasnip)
(ts.setup {:pickers {:file_files {:find_command [:fd :--type :f :--strip-cwd-prefix]}}})

(let [map (partial vim.keymap.set :n)]
  (map :<leader>ff tsb.find_files)
  (map :<leader>fb tsb.buffers)
  (map :<leader>fg tsb.live_grep)
  (map :<leader>fss tsb.spell_suggest)
  (map :<leader>fd tsb.diagnostics))
