class Example
  def ifs
    # Bad: unless signed_in?
    if signed_out?
      do_something
    end
  end
end
