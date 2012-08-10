class SomeClass
  SOME_CONSTANT = 'upper case name'

  def initialize(attributes)
    @some_attribute = attributes[:some_attribute]
    @another_attribute = attributes[:another_attribute]
  end

  def method_with_arguments(argument_one, argument_two)
    this_is_a_really_line_that_should_be_broken_up_over_multiple_lines_and.
      every_line_but_the_first_is_indented
  end

  def method_with_multiline_block
    items.each do |item|
      do_something_with_item
    end
  end

  def method_with_single_line_block
    items.map { |item| item.some_attribute }
  end

  def method_that_returns_an_array
    [item_one, item_two]
  end

  def method_that_returns_a_hash
    { :key => 'value' }
  end

  def method_that_uses_infix_operators
    left + middle - right
  end

  def method_without_arguments
    method_start

    if complex_condition?
      positive_branch
    else
      negative_branch
    end

    rest_of_body
  end

  def self.class_method
    method_body
  end

  private

  def complex_condition?
    part_one? && part_two?
  end
end
