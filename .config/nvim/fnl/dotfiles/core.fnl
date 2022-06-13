(module dotfiles.core
  {autoload {a aniseed.core
             nvim aniseed.nvim
             str aniseed.string}})

(defn- exec [cmd]
  (let [handle (io.popen cmd)
        out (handle:read "*a")]
    (handle:close)
    out))

;; General
(set nvim.o.number true)
(set nvim.o.colorcolumn "120")
(set nvim.o.cursorline true)

;; Window
(set nvim.o.splitright true)
(set nvim.o.showmode false)
(set nvim.o.guifont "SF Mono Powerline:h18")

;; Spelling
(set nvim.o.spell true)
(set nvim.o.spelloptions "camel")

;; Searching
(set nvim.o.ignorecase true)

;; Indentation
(set nvim.o.tabstop 2)
(set nvim.o.softtabstop 2)
(set nvim.o.shiftwidth 2)
(set nvim.o.smartindent true)
(set nvim.o.expandtab true)
(set nvim.o.autoindent true)

;; Leaders
(set nvim.g.mapleader ",")
(set nvim.g.maplocalleader ",")

;; Experimental
(set nvim.g.do_filetype_lua 1)
(set nvim.g.did_load_filetypes 0)

;;; Files and directories
(set nvim.o.autowrite true)
(set nvim.o.autowriteall true)

;; Not supported on Terminal.app
(if (not= "Apple_Terminal" (os.getenv "TERM_PROGRAM"))
  (set nvim.o.termguicolors true))

;; Hosts and providers
;; (set nvim.g.python3_host_prog (exec "pyenv which python3"))
