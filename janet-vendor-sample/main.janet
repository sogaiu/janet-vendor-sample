(import ./lib/spork-a/json :as json-a)
(import ./lib/spork-b/json :as json-b)

(defn main
  [& argv]
  (def test-struct
    {:jsonrpc "2.0"
     :id "1"
     :result :})
  (printf "spork-a: %s" (json-a/encode test-struct))
  (printf "spork-b: %s" (json-b/encode test-struct))
  (printf "spork-a: %s" (json-a/encode test-struct))
  (printf "spork-b: %s" (json-b/encode test-struct)))
