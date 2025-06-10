  $ decalque -e '40+2'
  42

  $ decalque -e '2+20+20'
  42

  $ decalque -e '44-2'
  42

  $ decalque -e '21*2'
  42

  $ decalque -e '84/2'
  42

  $ decalque -e '40+2.0'
  42.

  $ decalque -e '44-2.0'
  42.

  $ decalque -e '21*2.0'
  42.

  $ decalque -e '84/2.0'
  42.

  $ decalque -e '2 * 10 + 2'
  22

  $ decalque -e '2 * (10 + 2)'
  24

  $ decalque -e '42 mod 2'
  parse error near character 7

  $ decalque -e '"lolzer"'
  lolzer

  $ decalque -e '"hello" ^ " worlds"'
  hello worlds

  $ decalque -e '"foobar" # "bar"'
  foo

  $ decalque -e ':is_even 2'
  true

  $ decalque -e ':is_odd 3' 
  true

  $ decalque -e 'true :and true'
  parse error near character 5

  $ decalque -e 'true :or false'
  parse error near character 5
