(module dotfiles.plugin.lsp
  {autoload {a aniseed.core
             nvim aniseed.nvim
             lsp lspconfig
             cmplsp cmp_nvim_lsp}})

(def opts {:capabilities (cmplsp.update_capabilities (vim.lsp.protocol.make_client_capabilities))})

(lsp.clojure_lsp.setup opts)
(lsp.pyright.setup opts)
(lsp.sourcekit.setup opts)
(lsp.sumneko_lua.setup (a.merge opts {:settings {:Lua {:telemetry {:enable false}}}}))
