Code Conventions
================

A guide for using small composable classes in Rails.

Contents
--------

1. [Service Objects](#service-objects)
1. [Workflow Objects](#workflow-objects)

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

Workflow Objects
----------------

Objects that compose multiple [service objects](#service-objects) (and possibly also using other objects too), to complete a workflow of actions related to a business process.

Workflow classes:

* Live in `app/workflows/workflow/`
* Named similarly to service objects, like `Workflow::MaybeSomeContext::Verb`, e.g. `Workflow::SignupTeacher`, `Workflow::Teacher::DeleteClass`
* Have one public method, `#call`
* May call several service objects to fulfill a business process

Example:

```ruby
module Workflow
  module Teacher
    class CopyClass
      def initialize(original_class, new_product)
        @original_class, @new_product = original_class, new_product
        @teacher = @original_class.teacher
      end

      def call
        if has_capacity?
          new_class = Service::CreateSchoolClass.new(teacher, product).call
          original_class.students.each do |student|
            # Adds student to class, notifies them
            Workflow::SchoolClass::AddStudent.new(new_class, student).call
          end
          Service::SchoolClass::Created::NotifySubCo.new(new_class).call
        end
      end

      private

      attr_reader :original_class, :teacher, :new_product

      def has_capacity?
        Policy::Subscription::Capacity::Validator.new(teacher, product).has_capacity?
      end
    end
  end
end

```
