module MiniChef
  #
  #
  # This class is meant to compile the template within an almost empty execution context.
  # Now we can make use of method missing to access the keys of the variables hash as if they
  # were method inside the template without risking collisions with our own methods.
  #
  # Example:
  #
  # Inside template.erb :
  #
  #   $nodes: <%= node_number %>;
  #
  # ==> resolves to config[:node_number] through method_missing
  #
  #
  #
  class TemplateContext < Struct.new(:source_contents, :variables)
    def result
      ERB.new(source_contents).result(binding)
    end

    def method_missing(name)
      return variables[name]      if variables[name]      != nil
      return variables[name.to_s] if variables[name.to_s] != nil
      raise "Undefined variable or method #{name}"
    end
  end
end
