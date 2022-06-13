(module dotfiles.plugin.lsp
  {autoload {a aniseed.core
             nvim aniseed.nvim
             lsp lspconfig
             cmplsp cmp_nvim_lsp}})

(def- map (partial vim.keymap.set :n))

(defn- on_attach [_ buf]
    (let [map (fn [lhs rhs]
                (map lhs rhs {:buffer buf}))]
      (map :gD vim.lsp.buf.declaration)
      (map :gd vim.lsp.buf.definition)
      (map :K vim.lsp.buf.hover)
      (map :<C-k> vim.lsp.buf.signature_help)
      (map :<Space>wa vim.lsp.buf.add_workspace_folder)
      (map :<Space>wr vim.lsp.buf.remove_workspace_folder)
      (map :<Space>D vim.lsp.buf.type_definition)
      (map :<Space>rn vim.lsp.buf.rename)
      (map :<Space>ca vim.lsp.buf.code_action)
      (map :gr vim.lsp.buf.references)
      (map :<Space>f vim.lsp.buf.formatting)))

(defn- load [lsps]
  (let [caps (cmplsp.update_capabilities (vim.lsp.protocol.make_client_capabilities))
        options {:capabilities caps
                 :on_attach on_attach}]
    (each [name opts (pairs lsps)]
      (let [l (. lsp name)]
        (l.setup (a.merge options opts))))))

(load {:clojure_lsp {}
       :pyright {}
       :sourcekit {}
       :sumneko_lua {:settings {:Lua {:telemetry {:enable false}}}}
       :svelte {}
       :tsserver {}})
