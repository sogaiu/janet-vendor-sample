(use ../spork-b/test)
(import ../spork-b/mdz)

(start-suite)
(assert-docs "../spork-b/mdz")
(assert (= [:img {:src "test.jpg" :alt "test"}]
           (mdz/image "test.jpg" "test")) "image alt")

(assert (= [:pre {} "test"] (mdz/pre "test")) "pre string")
(assert (= [:pre {} [:div "test"]] (mdz/pre [:div "test"])) "pre element")
(end-suite)
