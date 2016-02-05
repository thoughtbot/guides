### Using Pundit to Limit Access to API Endpoints

Pundit's github: https://github.com/elabs/pundit

This guide is designed to explain a simple implementation of Pundit. For more advanced features, check out the git.

## Setup Pundit

Add Pundit to your GEMFILE

```
gem 'pundit'
```

Include pundit in yout application controller

```
class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery ...
end
```

Run the rails generator in your terminal

```
rails g pundit:install
```

This will create a directory at ```app/policies/``` and create a base policy called ```Application Policy```. This policy will create some smart defaults for CRUD actions ('create', 'show', 'update', 'destroy').

If the authorize method fails, Pundit will throw a ```Pundit::NotAuthorizedError```. In your ```application_controller.rb``` or ```api_controller.rb``` rescue the error and return the proper status code

```
class V1::ApiController < ApplicationController
  protect_from_forgery with: :null_session
  ...
  rescue_from Pundit::NotAuthorizedError do |exception|
    render json: { errors: exception.message }, status: :forbidden
  end
end
```

## Create a Policy

In this example we'll be creating a policty for the endpoint ```GET /Albums/:id```. In this instance, users should only be able to get a specific album if they are already following it. If not, they should receive a ```403 Forbidden``` response.

A policy is created to restricted access to data in the database for specific endpoints. To accomplish this, policies are written for specific models. To help rails find the right one, policies should have a name that references the model that they are checking.

**Endpoint** - The controller before implementing the policy

```
class V1::AlbumsController < V1::AuthenticatedController
  def show
    album = Album.includes(:photos).find_by!(id: params[:id])

    render json: album
  end
  
  ...other endpoints
end
```

Since this endpoint is about showing albums, the policy needs to check whether an album record is viewable by the current user

**Model** - Implement the policy for this model

```
class Album < ActiveRecord::Base
  ...
end

```

The policy name references the model that it checks and the inherits from ```ApplicationPolicy```. If needed, Pundit will search for a method called ```current_user``` and will try to assign it to the user param in a policy's ```def initialize``` method. 

Policies have query methods for endpoints. This example implements the ```show?``` method. The method simply needs to return a boolean that determines if the current user has access to that resource. This endpoint is using the ```acts_as_follower``` gem and checks whether the user is currently following the album. If they are the policy succeeds and returns ```true```, if not, the policy returns ```false```.

Any ruby code can be put in here as long as it achieves the desired rules for accessing the resource.

**Policy** - The policy to implement

```
class AlbumPolicy < ApplicationPolicy
  attr_reader :user, :album

  def initialize(user, album)
    @user = user
    @album = album
  end

  def show?
    user.following?(album)
  end
end
```

## Apply a Policy

To apply a policy to an endpoint include a line calling the ```authorize``` method on a resource.

```
class V1::AlbumsController < V1::AuthenticatedController
  def show
    album = Album.includes(:photos).find_by!(id: params[:id])
    authorize album

    render json: album
  end
end

```

Pundit will attempt to find the proper query method based on the controller action. Specific queries can be included as parameters in the authorize method if rails can not automatically locate them

```
authorize album, :show?
```
