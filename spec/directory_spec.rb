require 'spec_helper'

describe MiniChef::Directory, "DSL" do
  let(:directory) { MiniChef::Directory.new(anything) }

  it "sets the attributes following the DSL" do
    directory.instance_eval do
      owner  "owner"
      group  "group"
      mode   "mode"
    end
    expect(directory.owner).to      eq("owner")
    expect(directory.group).to      eq("group")
    expect(directory.mode).to       eq("mode")
  end
end
