def do_it(counter)

  if counter >= 0
    puts counter
    do_it(counter-1)
    puts counter
  end

end

do_it(5)
