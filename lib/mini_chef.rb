require "erb"
require "mini_chef/version"
require "mini_chef/dsl"
require "mini_chef/file_utils_macros"
require "mini_chef/execute"
require "mini_chef/template"
require "mini_chef/template_context"
require "mini_chef/directory"


module MiniChef
  def self.define(&block)
    dsl = DSL.new
    dsl.instance_eval(&block)
  end
end
