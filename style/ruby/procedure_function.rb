class Worker
  def initialize(numbers)
    @numbers = numbers
  end

  # function -- using the return value
  def square
    @numbers.to_a.map { |n|
      # some expressions...
      n ** 2
    }
  end

  # procedure -- not using the return value
  def echo
    @numbers.each do |n|
      puts n
    end
  end
end

w = Worker.new((1..10))
p w.square
w.echo
