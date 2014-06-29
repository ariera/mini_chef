require 'spec_helper'

describe MiniChef::Template, "DSL" do
  let(:template) { MiniChef::Template.new(anything) }

  it "sets the attributes following the DSL" do
    template.instance_eval do
      source "path_to_template"
      owner  "owner"
      group  "group"
      mode   "mode"
    end
    expect(template.source).to eq("path_to_template")
    expect(template.owner).to  eq("owner")
    expect(template.group).to  eq("group")
    expect(template.mode).to   eq("mode")
  end

end

describe MiniChef::Template, "#execute" do
  let(:destination) { File.join(GEM_TMP_DIR, "example.conf") }
  let(:source)      { File.join(GEM_TEST_FILES, "example.conf.erb")}
  let(:template)    { MiniChef::Template.new(destination) }

  it "outputs the compiled template to the desired destination" do
    template.source source
    template.execute
    expect(File.file?(destination)).to be true
  end

end
