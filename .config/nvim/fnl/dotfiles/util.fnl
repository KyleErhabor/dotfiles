(module dotfiles.util
  {autoload {a aniseed.core}})

(defn create-set [...]
  "Creates a table meant to hold unique elements."
  (let [elems [...]]
    (collect [_ e (ipairs elems)]
      (values e true))))
