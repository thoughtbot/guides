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
* Using flags, modes, etc as parameters to switch upon probably means you want a separate class 

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

Resources:
* [Code Climate Blog - 7 Patterns to Refactor Fat ActiveRecord Models - 2. Extract Service Objects](http://blog.codeclimate.com/blog/2012/10/17/7-ways-to-decompose-fat-activerecord-models/#service-objects)
* [brewhouse blog - Gourmet Service Objects](http://brewhouse.io/blog/2014/04/30/gourmet-service-objects.html)
