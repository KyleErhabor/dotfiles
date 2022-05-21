(module dotfiles.plugin.cmp
  {autoload {a aniseed.core
             nvim aniseed.nvim
             : cmp
             cmpctx cmp.config.context
             : luasnip}})

(set nvim.o.completeopt "menu,menuone,noselect")

(defn- words-before? []
  (let [[line col] (vim.api.nvim_win_get_cursor 0)]
    (and
      (not= 0 col)
      (let [s (a.first (vim.api.nvim_buf_get_lines 0 (a.dec line) line true))
            ss (s:sub col col)]
        (a.nil? (ss:match "%s"))))))

(let [window cmp.config.window.bordered]
  (cmp.setup {:snippet {:expand #(luasnip.lsp_expand $.body)}
              :window {:completion (window)
                       :documentation (window)}
              :mapping (cmp.mapping.preset.insert {:<C-b> (cmp.mapping.scroll_docs -4)
                                                   :<C-f> (cmp.mapping.scroll_docs 4)
                                                   :<C-Space> (cmp.mapping.complete)
                                                   :<C-e> (cmp.mapping.abort)
                                                   :<CR> (cmp.mapping.confirm {:select true})
                                                   :<Tab> (cmp.mapping (fn [fallback]
                                                                         (if
                                                                           (cmp.visible) (cmp.select_next_item)
                                                                           (luasnip.expand_or_jumpable) (luasnip.expand_or_jump)
                                                                           (words-before?) (cmp.complete)
                                                                           (fallback))) [:i :s])
                                                   :<S-Tab> (cmp.mapping (fn [fallback]
                                                                           (if
                                                                             (cmp.visible) (cmp.select_prev_item)
                                                                             (luasnip.jumpable -1) (luasnip.jump -1)
                                                                             (fallback))) [:i :s])})
              :sources (cmp.config.sources
                         [{:name :nvim_lsp}
                          {:name :luasnip}
                          {:name :conjure}
                          {:name :nvim_lsp_signature_help}]
                         [{:name :buffer}])})
  (cmp.setup.filetype :gitcommit {:sources (cmp.config.sources [{:name :cmp_git}
                                                                {:name :buffer}])})
  (cmp.setup.cmdline :/ {:mapping (cmp.mapping.preset.cmdline)
                         :sources [{:name :buffer}]})
  (cmp.setup.cmdline :: {:mapping (cmp.mapping.preset.cmdline)
                         :sources (cmp.config.sources
                                    [{:name :path}]
                                    [{:name :cmdline}])}))
