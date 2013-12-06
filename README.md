# rds-permissions

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'rds-permissions'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rds-permissions

## Usage


#### Create rails initializer (permissions.rb)

config api endpoint by adding this line:

    Rds::Permissions::Config.api_endpoint = "http://rds-users.smartsoftasia.com/api/v1/authorization/authorize"

Include rds-permissions in ActionController :

    include Rds::Permissions

In action methods :
    
    def show
      require_permissions!( :users_read )
    end

or:

    def show
      if require_permissions?( :users_read, :users_manage )
        ..do something...
      end
    end



## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
