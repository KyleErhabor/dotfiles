(module dotfiles.plugin
  {autoload {a aniseed.core
             : packer}})

(defn- configure [name]
  (let [(ok? v) (pcall require (.. *module-name* "." name))]
    (if (not ok?)
      (print "dotfiles error:" v))))

(defn- load [pkgs]
  (packer.startup
    (fn [use]
      (each [name opts (pairs pkgs)]
        (use (a.assoc opts 1 name))
        (-?> opts.mod configure)))))

(load {:wbthomason/packer.nvim {}
       :Olical/aniseed {:mod :aniseed}
       :PaterJason/cmp-conjure {}
       :numToStr/Comment.nvim {:mod :comment}
       :Olical/conjure {:mod :conjure}
       :lewis6991/gitsigns.nvim {:mod :gitsigns}
       :ellisonleao/glow.nvim {:branch :main}
       :rebelot/kanagawa.nvim {:mod :kanagawa}
       :nvim-lualine/lualine.nvim {:requires [:kyazdani42/nvim-web-devicons]
                                   :mod :lualine}
       :L3MON4D3/LuaSnip {:requires [:rafamadriz/friendly-snippets]
                          :mod :luasnip}
       :jghauser/mkdir.nvim {}
       :TimUntersberger/neogit {:requires [:nvim-lua/plenary.nvim]
                                :mod :neogit}
       :hrsh7th/nvim-cmp {:requires [:neovim/nvim-lspconfig :hrsh7th/cmp-nvim-lsp :hrsh7th/cmp-buffer :hrsh7th/cmp-path
                                     :hrsh7th/cmp-cmdline
                                     ;; Luasnip
                                     :L3MON4D3/LuaSnip :saadparwaiz1/cmp_luasnip
                                     ;; Custom
                                     :PaterJason/cmp-conjure]
                          :mod :cmp}
       :Olical/nvim-local-fennel {:requires [:Olical/aniseed]}
       :neovim/nvim-lspconfig {:mod :lsp}
       :rcarriga/nvim-notify {:mod :notify} ; TODO: Rename to notify
       :nvim-treesitter/nvim-treesitter {:run ::TSUpdate
                                         :mod :treesitter}
       :romgrk/nvim-treesitter-context {:mod :treesitter-context}
       :nvim-treesitter/nvim-treesitter-textobjects {}
       :nvim-treesitter/nvim-treesitter-refactor {}
       :p00f/nvim-ts-rainbow {}
       :kyazdani42/nvim-web-devicons {:mod :web-devicons}
       :andweeb/presence.nvim {:mod :presence}
       :sunjon/shade.nvim {:mod :shade}
       :lewis6991/spellsitter.nvim {:mod :spellsitter}
       :nvim-telescope/telescope.nvim {:requires [:nvim-lua/plenary.nvim]
                                       :mod :telescope}
       :nvim-telescope/telescope-fzf-native.nvim {:run :make}
       :nvim-telescope/telescope-symbols.nvim {}
       :benfowler/telescope-luasnip.nvim {:module :telescope._extensions.luasnip}
       ;; :arzg/vim-colors-xcode {:mod :vim-colors-xcode}
       :tpope/vim-dispatch {:cmd [:Dispatch :Make :Focus :Start]}
       :radenling/vim-dispatch-neovim {}
       :clojure-vim/vim-jack-in {}
       :guns/vim-sexp {:requires [:tpope/vim-repeat]}})
