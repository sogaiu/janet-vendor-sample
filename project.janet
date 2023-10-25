(def name "janet-vendor-sample")

(declare-project
  :name name
  :url (string "https://github.com/sogaiu/" name))

(declare-source
  :source @[name])

(declare-binscript
  :main "jvs"
  :is-janet true)

(def proj-root (os/cwd))

(task "build-spork-a" []
  (os/cd proj-root)
  (os/cd "spork-a")
  (os/execute ["jpm"
               "build" (string "--tree=../" name)] :px)
  (os/execute ["jpm"
               "install" (string "--tree=../" name)] :px)
  (os/cd proj-root))

(add-dep "build" "build-spork-a")

(task "clean-spork-a" []
  (os/cd proj-root)
  (os/cd "spork-a")
  (os/execute ["jpm" "clean"] :px)
  (os/execute ["jpm"
               "uninstall" (string "--tree=../" name)] :px)
  (os/cd proj-root))

(task "build-spork-b" []
  (os/cd proj-root)
  (os/cd "spork-b")
  (os/execute ["jpm"
               "build" (string "--tree=../" name)] :px)
  (os/execute ["jpm"
               "install" (string "--tree=../" name)] :px)
  (os/cd proj-root))

(add-dep "build" "build-spork-b")

(task "clean-spork-b" []
  (os/cd proj-root)
  (os/cd "spork-b")
  (os/execute ["jpm" "clean"] :px)
  (os/execute ["jpm"
               "uninstall" (string "--tree=../" name)] :px)
  (os/cd proj-root))

(task "clean-tidy" ["clean-spork-a" "clean-spork-b"]
  (os/cd proj-root)
  (os/cd name)
  (when (os/stat "bin")
    (os/rmdir "bin"))
  (when (os/stat "lib")
    (when (os/stat "lib/.manifests")
      (os/rmdir "lib/.manifests"))
    (os/rmdir "lib"))
  (when (os/stat "man")
    (os/rmdir "man"))
  (os/cd proj-root))

(add-dep "clean" "clean-tidy")
