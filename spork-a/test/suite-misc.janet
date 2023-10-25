(use ../spork-a/test)
(import ../spork-a/misc)

(start-suite)

#misc/dedent
(assert (= (misc/dedent "  a\n    b\n   c\n     d") "a\n  b\n c\n   d") "dedent")

#misc/set*
(do
  (var x 2)
  (var y 3)
  (misc/set* [x y] [y (+ x y)])
  (assert (and (= x 3) (= y 5)) "set* 1"))

(do
  (def x @[2 3])
  (misc/set* [[x 0] [x 1]] [(in x 1) (+ (in x 0) (in x 1))])
  (assert (deep= x @[3 5])))

#misc/trim-prefix

(assert (= (misc/trim-prefix "someprefix" "someprefixsomeprefixandmore") "someprefixandmore"))
(assert (= (misc/trim-prefix "🗲" "🗲🗲this-is-a-unicode-test🗲") "🗲this-is-a-unicode-test🗲"))


#misc/trim-suffix

(assert (= (misc/trim-suffix "somesuffix" "someprefix-midpart-somesuffixsomesuffix") "someprefix-midpart-somesuffix"))

(assert (= (misc/trim-suffix "🗲" "🗲this-is-a-unicode-test🗲🗲") "🗲this-is-a-unicode-test🗲"))

#misc/print-table
(def output
  (misc/capout
    (misc/print-table [{"aaaa" 1 "b" 2} {"aaaa" 4 "b" 5}] ["aaaa" "b" "b" "b" "b"])))
(def expected
  ```
╭────┬─┬─┬─┬─╮
│aaaa│b│b│b│b│
╞════╪═╪═╪═╪═╡
│   1│2│2│2│2│
│   4│5│5│5│5│
╰────┴─┴─┴─┴─╯
  ```)
(assert (= (-> output string/trim) (-> expected string/trim)))

(def output2
  (misc/capout
    (misc/print-table [{"title" "你好世界" "value" 3} {"title" "小苹果" "value" 4}])))
(def expected2
  ```
╭────────┬─────╮
│  title │value│
╞════════╪═════╡
│你好世界│    3│
│  小苹果│    4│
╰────────┴─────╯
  ```)
(assert (= (-> output2 string/trim) (-> expected2 string/trim)))

(end-suite)
