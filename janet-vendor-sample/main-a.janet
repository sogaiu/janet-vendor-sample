(import ./lib/spork-a/json :as json-a)

(defn main
  [& argv]
  (def test-struct
    {:jsonrpc "2.0"
     :id "1"
     :result :})
  (printf "spork-a: %s" (json-a/encode test-struct)))
