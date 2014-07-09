module MiniChef
  class DSL
      module Options

      # Programatically define setter methods for the DSL than act as readers
      # if not arguments are passed
      #
      # The defined methods are similar to this:
      #  def source(source=nil)
      #    @source = source if source
      #    @source
      #  end
      #
      def dsl_options(*opts)
        opts.each do |setter|
          define_method setter do |*args|
            args ||= []
            attribute_value = args.first
            instance_variable_set("@#{setter}", attribute_value) if attribute_value
            instance_variable_get("@#{setter}")
          end
        end
      end

    end
  end
end
