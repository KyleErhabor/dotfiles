(module dotfiles.plugin.treesitter
  {autoload {a aniseed.core
             ts nvim-treesitter.configs
             tsp nvim-treesitter.parsers}})

(let [rainbow_langs {:clojure true
                     :fennel true}]
  (ts.setup {:ensure_installed [:comment :fennel :lua :vim]
             :highlight {:enable true}
             :incremental_selection {:enable true}
             :indent {:enable true}

             :refactor {:highlight_definitions {:enable true}
                        :highlight_current_scope {:enable true}
                        :smart_rename {:enable true}
                        :navigation {:enable true
                                     :keymaps {:goto_definition "gnd"
                                               :list_definitions "gnD"
                                               :list_definitions_toc "gO"
                                               :goto_next_usage "<a-*>"
                                               :goto_previous_usage "<a-#"}}}
             :rainbow {:enable true
                       ;; Just has to be a lisp.
                       :disable (a.filter #(not (. rainbow_langs $1)) (tsp.available_parsers))
                       :colors [:White :#FC4444 :#FC8404 :#FCD444 :#8CC43C :#5bc0de :#b776f5]
                       }
             :textobjects {:select {:enable true
                                    :lookahead true
                                    :keymaps {"af" "@function.outer"
                                              "if" "@function.inner"
                                              "ac" "@class.outer"
                                              "ic" "@class.inner"}}
                           :swap {:enable true
                                  :swap_next {:<leader>a "@parameter.inner"}
                                  :swap_previous {:<leader>A "@parameter.inner"}}
                           :move {:enable true
                                  :set_jumps true
                                  :goto_next_start {"]m" "@function.outer"
                                                    "]]" "@class.outer"}
                                  :goto_next_end {"]M" "@function.outer"
                                                  "][" "@class.outer"}
                                  :goto_previous_start {"[m" "@function.outer"
                                                        "[[" "@class.outer"}
                                  :goto_previous_end {"[M" "@function.outer"
                                                      "[]" "@class.outer"}}
                           :lsp_interop {:enable true
                                         :border :none
                                         :peek_definition_code {:<leader>df "@function.outer"
                                                                :<leader>dF "@class.outer"}}}
             :tree-docs {:enable true}}))
