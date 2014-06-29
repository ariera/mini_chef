# inspired on http://robots.thoughtbot.com/writing-a-domain-specific-language-in-ruby

module MiniChef
  class DefinitionProxy
    def template(destination, &block)
      puts "defining a template pointing to #{destination}."
      template = Template.new(destination)
      if block_given?
        template.instance_eval(&block)
      end
      template.execute
      template
    end
  end
end
