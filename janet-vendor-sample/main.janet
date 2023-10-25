(import ./lib/spork/base64)

(defn main
  [& args]
  (print (base64/encode "hello"))
  (pp args))

