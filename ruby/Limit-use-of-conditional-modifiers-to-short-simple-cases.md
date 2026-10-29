# Limit use of conditional modifiers to short, simple cases

Conditional modifiers (i.e., `if` or `unless` at the end of a line) can be
surprising when they appear on long or complex lines. The reader might not see
them while scanning the code.

So, prefer to use them only for short, simple cases. For example:

```ruby
do_later if async?
```

The example above can read more naturally than:

```rb
if async?
  do_later
end
```

## Complex conditions

However, if the line is too long (around 80 characters) or complex (e.g., an
`if` with multiple conditions like `if a && b`) prefer the multi-line form:

```ruby
# Avoid
block_access! if signed_in? && !current_user.active?

# Prefer
if signed_in? && !current_user.active?
  block_access!
end
```

There might be cases where the conditional modifier work well with multiple
conditions, so use your best judgment.

## An opportunity to refactor

If the conditions are related, consider extracting a method that groups them.
This might allow you to use the conditional modifier form again.

```ruby
def inactive_user?
  signed_in? && !current_user.active?
end

block_access! if inactive_user?
```

## Conditional modifiers feel informal

The modifier form of conditionals can feel more casual than the multi-line form.
Conversely, the multi-line form _draws attention_ to the conditional and the
code that follows it. Use this to your advantage when you want to emphasize the
conditional and the code that follows it.

```rb
# Avoid
def action
  return destroy_all if really?

  do_nothing
end

# Prefer
def action
  if really?
    destroy_all
  else
    do_nothing
  end
end
```

You can also refactor the code so the less destructive action uses a conditional
modifier, which pairs well with the informal feel of the modifier form:

```rb
def action
  return do_nothing if chill?

  destroy_all
end
```

## References

- You can see further discussion of this guideline here: [#738](https://github.com/thoughtbot/guides/pull/738)
