module MiniChef
  module FileUtilsMacros
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
