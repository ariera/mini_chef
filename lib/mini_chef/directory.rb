module MiniChef
  class Directory
    extend MiniChef::DSL::Options
    include MiniChef::FileUtilsMacros

    dsl_options :source, :owner, :group, :user, :mode

    attr_accessor :destination # used for testing purposes
    def initialize(destination)
      @destination = destination
    end

    def execute
      create_dir
      set_owner if owner
      set_group if group
      set_mode  if mode
    end

    def create_dir
      FileUtils.mkdir_p(destination)
    end
  end
end
