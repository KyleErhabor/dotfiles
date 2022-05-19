(module dotfiles.plugin.lualine
  {autoload {nvim aniseed.nvim
             : lualine}})

;; modus-vivendi
(lualine.setup {:options {:theme :auto
                          :globalstatus true}
                :sections {:lualine_b [[:branch]
                                       [:diff] ; TODO: Consider colors.
                                       {1 :diagnostics
                                        :update_in_insert true}]
                           :lualine_c [{1 :filename
                                        :path 1}]
                           :lualine_x [[:filetype]]}})
