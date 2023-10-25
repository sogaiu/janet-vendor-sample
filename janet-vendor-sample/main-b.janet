(import ./lib/spork-b/json :as json-b)

(defn main
  [& argv]
  (def test-struct
    {:jsonrpc "2.0"
     :id "1"
     :result :})
  (printf "spork-b: %s" (json-b/encode test-struct)))
