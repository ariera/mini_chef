module MiniChef
  class Template
    extend MiniChef::DSL::Options
    include MiniChef::FileUtilsMacros

    dsl_options :source, :owner, :group, :user, :mode, :variables

    attr_accessor :destination # used for testing purposes
    def initialize(destination)
      @destination = destination
      @variables = {}
    end

    def execute
      save_to_file
      set_owner if owner
      set_group if group
      set_mode  if mode
    end

    def save_to_file
      dirname = File.dirname destination
      unless File.directory?(dirname)
        FileUtils.mkdir_p(dirname)
      end
      File.open(destination, "w+") do |f|
        f.write(render)
      end
    end

    def render
      source_contents = File.open(source).read
      MiniChef::TemplateContext.new(source_contents, variables).result
    end
  end
end
