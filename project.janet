(def name "janet-vendor-sample")

(declare-project
  :name name
  :url (string "https://github.com/sogaiu/" name))

(declare-source
  :source @[name])

(declare-binscript
  :main "jvs"
  :is-janet true)

(task "build-spork" []
  (os/cd "spork")
  (os/execute ["jpm"
               "build" (string "--tree=../" name)] :px)
  (os/execute ["jpm"
               "install" (string "--tree=../" name)] :px)
  (os/cd ".."))

(add-dep "build" "build-spork")

(task "clean-spork" []
  (os/cd "spork")
  (os/execute ["jpm" "clean"] :px)
  (os/execute ["jpm"
               "uninstall" (string "--tree=../" name)] :px)
  (os/cd ".."))

(add-dep "clean" "clean-spork")

