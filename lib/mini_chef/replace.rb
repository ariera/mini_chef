require 'pry'
module MiniChef
  class Replace
    extend MiniChef::DSL::Options

    dsl_options :what, :with

    attr_accessor :destination # used for testing purposes
    def initialize(destination)
      @destination = destination
    end

    def execute
      text = File.read(destination)
      replaced_text = text.gsub(what, with)
      File.open(destination, "w"){ |f| f.write replaced_text }
    end
  end
end
