(declare-project
  :name "spork-b"
  :description "Official contrib library of various Janet utility modules."
  :author "Calvin Rose"
  :license "MIT"
  :url "https://github.com/janet-lang/spork"
  :repo "git+https://github.com/janet-lang/spork")

(declare-source
  :source @["spork-b"])

# Scripts

'(declare-binscript
  :main "bin/janet-format"
  :hardcode-syspath true
  :is-janet true)

'(declare-binscript
  :main "bin/janet-netrepl"
  :hardcode-syspath true
  :is-janet true)

# Natives

(declare-native
  :name "spork-b/json"
  :source @["src/json.c"])

(declare-native
  :name "spork-b/rawterm"
  :source @["src/rawterm.c"])

(declare-native
  :name "spork-b/crc"
  :source @["src/crc.c"])

(declare-native
  :name "spork-b/utf8"
  :source @["src/utf8.c"])

(declare-native
 :name "spork-b/tarray"
 :headers @["src/tarray.h"]
 :source @["src/tarray.c"])

(declare-headers
 :headers ["src/tarray.h"])

(declare-native
  :name "spork-b/zip"
  :source @["src/zip.c" "deps/miniz/miniz.c"]
  :defines @{"_LARGEFILE64_SOURCE" true}
  :headers @["deps/miniz/miniz.h"])

(declare-native
  :name "spork-b/cmath"
  :source @["src/cmath.c"])
