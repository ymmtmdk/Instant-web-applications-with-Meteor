Sales2013.allow update: (userId, sales, fields, modifier) ->
  p userId, sales, fields, modifier
  return false  if userId isnt sales.owner # not the owner
  allowed = ["total"]

  # underscore library is built-in for now
  return false  if _.difference(fields, allowed).length # tried to write to forbidden field
  true
