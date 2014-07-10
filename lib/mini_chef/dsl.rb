require "mini_chef/dsl/options"

# inspired on http://robots.thoughtbot.com/writing-a-domain-specific-language-in-ruby
module MiniChef
  class DSL
    def template(destination, &block)
      puts "defining a template pointing to #{destination}."
      run_command(Template.new(destination), &block)
    end

    def directory(destination, &block)
      puts "creating directory #{destination}."
      run_command(Directory.new(destination), &block)
    end

    def execute(cmd, &block)
      puts "executing command `#{cmd}`."
      run_command(Execute.new(cmd), &block)
    end

    def replace(destination, &block)
      puts "replacing file `#{destination}`."
      run_command(Replace.new(destination), &block)
    end

    private
    def run_command(command, &block)
      if block_given?
        command.instance_eval(&block)
      end
      command.execute
      command
    end
  end
end
