some_instance = SomeClass.new

# Good:
some_instance.method_with_arguments("arg_1", "arg 2")

# Bad:
some_instance.method_with_arguments "arg_1", "arg_2"
