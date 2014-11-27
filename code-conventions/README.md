Code Conventions
================

A guide for using small composable classes in Rails.

Service Objects
---------------

Objects that *do an action*, and only one action (as opposed to [workflow objects](#workflow-objects), which compose service objects).

Service classes:

* Live in `app/services/service/`
* Named like `Service::MaybeSomeContext::VerbNoun`, e.g. `Service::ConsumeResetToken` (if this was `User` specific, could also be `Service::User::ConsumeResetToken`)
* Have one public method, `#call`
* May be initialized with many objects, encapsulating the business logic to do something with them

Example:

```ruby
module Service
  class ConsumeResetToken
    def initialize(user, token)
      @user = user
      @token_validity = valid_token?(user, token)
    end

    # [g] Check validity of a token and reset the token regardless.
    # - Return true if the token passed into service matched the users token
    def call
      reset_token!
      token_validity
    end

    private
    attr_reader :user, :token_validity

    def valid_token?(user, token)
      user && user.single_access_token == token
    end

    def reset_token!
      Adapter::AuthLogic.reset_token!(user)
    end
  end
end
```
