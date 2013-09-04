def some_func
  result = "blah".swapcase!
  mail_to user.email, user.name, :encode => :javascript
  puts result
end