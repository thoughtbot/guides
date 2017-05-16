"How to"
========

.. Contenido::

... corro una app en Rails ?
----------------------------

Usa suspenders_:

.. code:: sh

  $ gem install suspenders
  $ suspenders the-name-of-your-project-here
  $ cd the-name-of-your-project-here/
  $ bin/setup
  $ rake

.. _suspenders: https://github.com/thoughtbot/suspenders

... pruebo el Javascript de una app en Rails?
------------------------------------------

Usa capybara-webkit_. en tu ``Gemfile``:

.. code:: ruby

  gem "capybara-webkit"

In ``spec/support/capybara_webkit.rb`` (for Rspec):

.. code:: ruby

  Capybara.javascript_driver = :webkit
  
  Capybara::Webkit.configure do |config|
    config.block_unknown_urls
  end

Cuando escribas un spec, bebes de poner la bandera ``:js`` a la prueba para que lo vea
capybara-webkit. Por ejemplo, en ``spec/features/user_signs_in_spec.rb``:

.. code:: ruby

  feature "Authentication", :js do
    scenario "A user signing in" do
      create(:user, email: "me@example.com", password: "sekrit")
  
      sign_in_as email: "me@example.com", password: "sekrit"
  
      expect(page).to have_text("Welcome!")
    end
  end

.. _capybara-webkit: https://github.com/thoughtbot/capybara-webkit
