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

  $ decalque -e '42 mod 2'
  parse error near character 8

  $ decalque -e '"lolzer"'
  lolzer

  $ decalque -e '"hello" ^ " worlds"'
  hello worlds

  $ decalque -e '"foobar" # "bar"'
  foo

  $ decalque -e ':is_even n'
  parse error near character 2

  $ decalque -e ':is_odd n' 
  parse error near character 2

  $ decalque -e 'true :and true'


  $ decalque -e 'true :or false'