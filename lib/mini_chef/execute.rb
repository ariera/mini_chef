module MiniChef
  class Execute
    def initialize(cmd)
      @cmd = cmd
    end

    def execute
      system @cmd
    end
  end
end
