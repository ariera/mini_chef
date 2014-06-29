MiniChef
========

Generate files based on ERB templates and configuration variables, like the Chef template does.


## Installation

Add this line to your application's Gemfile:

    gem 'mini_chef'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mini_chef


## Usage

Example:

# setup.rb

    require "mini_chef

    MiniChef.define do

      template "/etc/monit/conf.d/nginx.conf" do
        source "setup/templates/nginx.conf.erb"
        owner "root"
        group "root"
        mode 0600
        variables {
          dir: "/etc/nginx"
        }
      end

    end


# nginx.conf.erb
    include       <%= dir %>/mime.types;


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Whishlist

- Default options (ex: default user, permissions)
- Option to overwrite the file if already exists or throw an error
- Better error handling
- Input validation
- Accept inline templates
- Command Line Interface
- Convention to get the configuration variables from another file?
- Global configuration variable? Easy access to env variables?
- Better variables hash (IndifferentAccess? Object/Json like access?)
