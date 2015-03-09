class SomeClass
  SOME_CONSTANT = "upper case name"

  def initialize(attributes)
    @some_attribute = attributes[:some_attribute]
    @another_attribute = attributes[:another_attribute]
    @user_factory = attributes[:user_factory]
  end

  def method_with_arguments(argument_one, argument_two)
    a_really_long_line_that_is_broken_up_over_multiple_lines_and.
      subsequent_lines_are_indented_and.
      each_method_lives_on_its_own_line
  end

  def method_with_long_signature(
    the_first_arg:,
    the_second_one:,
    and_another_one:
  )
    # code here
  end

  def method_with_required_keyword_arguments(one:, two:)
  end

  def method_with_multiline_block
    some_method_before_block(should_be_followed_by_a_newline)

    items.each do |item|
      do_something_with_item
      perform_another_action
    end

    some_method_after_block(should_follow_after_newline)
  end

  def method_with_single_method_block
    items.map(&:some_attribute)
  end

  def method_with_oneline_combined_methods_block
    items.map { |item| "#{item.one} #{item.two}" }
  end

  def method_that_returns_an_array
    [item_one, item_two]
  end

  def method_that_returns_a_hash
    { :key => "value" }
  end

  def method_with_large_hash
    {
      :one => "value",
      :two => "value",
    }
  end

  def method_with_large_array
    [
      :one,
      :two,
      :three,
    ]
  end

  def invoke_method_with_arguments_on_multiple_lines
    some_method(
      i_am_a_long_variable_name_that_will_never_fit_on_one_line_with_others,
      two,
      three
    )

    # Bad:
    some_method(one,
                two)
  end

  def method_which_uses_infix_operators
    left + middle - right
  end

  def method_which_uses_unary_operator
    !signed_in?
  end

  def method_without_arguments
    if complex_condition?
      positive_branch
    else
      negative_branch
    end

    rest_of_body
  end

  def method_that_uses_factory
    user = @user_factory.new
    user.ensure_authenticated!
  end

  def self.class_method
    method_body
  end

  protected

  attr_reader :foo
  attr_accessor :bar
  attr_writer :baz

  private

  def complex_condition?
    part_one? && part_two?
  end
end
