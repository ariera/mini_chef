require "erb"
require "mini_chef/version"
require "mini_chef/template"
require "mini_chef/template_context"
require "mini_chef/definition_proxy"

module MiniChef
  def self.define(&block)
    definition_proxy = DefinitionProxy.new
    definition_proxy.instance_eval(&block)
  end
end
