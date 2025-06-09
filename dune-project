(lang dune 3.17)
(using menhir 3.0)
(name decalque)

(generate_opam_files true)

(source
 (github username/reponame))

(authors "Author Name <author@example.com>")

(maintainers "Maintainer Name <maintainer@example.com>")

(license LICENSE)

(documentation https://url/to/documentation)

(package
 (name decalque)
 (synopsis "Decalque is part of the plloo. The Programming Languages Loo; an eyebrow reverence to the famous plzoo.")
 (description "Decalque is a language based on many calc exemples. 
 It is a play on words as decalque means both a copy and to be utterly tired; 
 state of which I am in when I code at night. This is a toy language for learning purpose.")
 (depends ocaml)
 (tags
  ("add topics" "to describe" your project)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/reference/dune-project/index.html
