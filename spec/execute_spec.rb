require 'spec_helper'

describe MiniChef::Execute, "DSL" do
  it "sets the attributes following the DSL" do
    execute_cmd = MiniChef::Execute.new("my_command")
    execute_cmd.stub(:system)

    execute_cmd.execute
    expect(execute_cmd).to have_received("system").with("my_command")
  end
end
