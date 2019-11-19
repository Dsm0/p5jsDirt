# tidal-stack

A stack-friendly wrapper for tidal.

The main methods for installing tidal assume a global install for ghc and thus a globally available Tidal package.  This project provides a wrapper for Tidal adopting the usual stack conventions and localised project.

The project contains a relatively current stack.yaml, and pins the tidal version to a specific commit.

Usage
===

command line
---

```
git clone https://github.com/tonyday567/tidal-boot
cd tidal-boot
stack build
stack ghci --ghci-options -XOverloadedStrings
```

From this point, for testing, I usually cut-n-paste BootTidal.hs into ghci.

Note that the stack.yaml is using nightly-2018-12-01 which is ghc-8.6.2.  To pop back a version, to ghc-8.4.4, just use:

```
stack build --resolver=lts-12.20
```

SuperCollider

```
/Applications/SuperCollider/SuperCollider.app/Contents/MacOS/sclang ~/tidal-stack/start.scd
```

emacs
---

emacs setup needs a slight tweak to use stack rather than cabal:

```
(require 'tidal)
(setq tidal-interpreter "stack")
(setq tidal-interpreter-arguments (list "ghci" "--ghci-options" "-XOverloadedStrings")
```

To test, open examples.tidal and run tidal-start-haskell <C-c C-s> and tidal-run-multiple-lines <C-return>.

