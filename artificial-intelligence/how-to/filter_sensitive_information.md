# Filter Sensitive Information

Before sending free text to an LLM or chatbot, filter all messages for
potentially sensitive information first.

```ruby
require "openai"
require "top_secret"

openai = OpenAI::Client.new(
  api_key: Rails.application.credentials.openai.api_key!
)

original_messages = [
  "Ralph lives in Boston.",
  "You can reach them at ralph@thoughtbot.com or 877-976-2687"
]

# Filter all messages
result = TopSecret::Text.filter_all(original_messages)
filtered_messages = result.items.map(&:output)

user_messages = filtered_messages.map { {role: "user", content: it} }

# Instruct LLM how to handle filtered messages
instructions = <<~TEXT
  I'm going to send filtered information to you in the form of free text.
  If you need to refer to the filtered information in a response, just reference it by the filter.
TEXT

messages = [
  {role: "system", content: instructions},
  *user_messages
]

chat_completion = openai.chat.completions.create(messages:, model: :"gpt-5")
response = chat_completion.choices.last.message.content

# Restore the response from the mapping
mapping = result.mapping
restored_response = TopSecret::FilteredText.restore(response, mapping:).output

puts(restored_response)
```
