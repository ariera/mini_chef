require "mini_chef/dsl/options"

# inspired on http://robots.thoughtbot.com/writing-a-domain-specific-language-in-ruby
module MiniChef
  class DSL
    def template(destination, &block)
      puts "defining a template pointing to #{destination}."
      template = Template.new(destination)
      if block_given?
        template.instance_eval(&block)
      end
      template.execute
      template
    end

    def directory(destination, &block)
      puts "creating directory #{destination}."
      directory = Directory.new(destination)
      if block_given?
        directory.instance_eval(&block)
      end
      directory.execute
      directory
    end

    def execute(cmd, &block)
      puts "executing command `#{cmd}`."
      execute = Execute.new(cmd)
      if block_given?
        execute.instance_eval(&block)
      end
      execute.execute
      execute
    end
  end
end
