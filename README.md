# Tinymethodwrapper

A small gem (22 lines of code) that allows you to wrap methods with a custom
call of another method.  Really useful for performing logging or other
options. We use this to log deprecated methods when doing large codebase
changes.


## Installation

Add this line to your application's Gemfile:

    gem 'tinymethodwrapper'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tinymethodwrapper

## Usage

    class User
      include Tinymethodwrapper

      def godzilla_rocks
        "yes"
      end

      def say_hi_to_name(name)
        name
      end

      wrap_methods %i[godzilla_rocks say_hi_to_name],
        -> (method_name) { Rails.logger.info "#{method_name} was just called" }
    end

    user = User.new
    user.godzilla_rocks
    #=> "yes"

    user.say_hi_to_name("hendrik")
    #=> "hendrik"

    #=> check the log fle, two logs were added

## Contributing

1. Fork it ( https://github.com/ZEITIO/tinymethodwrapper/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
