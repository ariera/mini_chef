module MiniChef
  class Template
    attr_accessor :destination #used for testing purposes

    TEMPLATE_SETTERS = [:source, :owner, :group, :user, :mode, :variables]

    def initialize(destination)
      @destination = destination
      @variables = {}
    end

    # Programatically define setter methods for the DSL than act as readers
    # if not arguments are passed
    #
    # The defined methods are similar to this:
    #  def source(source=nil)
    #    @source = source if source
    #    @source
    #  end
    TEMPLATE_SETTERS.each do |setter|
      define_method setter do |*args|
        args ||= []
        attribute_value = args.first
        instance_variable_set("@#{setter}", attribute_value) if attribute_value
        instance_variable_get("@#{setter}")
      end
    end

    def render
      source_contents = File.open(source).read
      MiniChef::TemplateContext.new(source_contents, variables).result
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

    def execute
      save_to_file
      set_owner if owner
      set_group if group
      set_mode  if mode
    end

    def set_owner
      FileUtils.chown(owner, nil, destination)
    end

    def set_group
      FileUtils.chown(nil, group, destination)
    end

    def set_mode
      FileUtils.chmod(mode, destination)
    end

  end
end
