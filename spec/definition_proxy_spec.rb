require 'spec_helper'


describe MiniChef::DefinitionProxy do
  let(:proxy) { MiniChef::DefinitionProxy.new }

  it "creates a template pointing to the desired destination" do
    template = proxy.template "path_to_file"
    expect(template).to be_a(MiniChef::Template)
    expect(template.destination).to eq("path_to_file")
  end

  it "evaluates its given block within the instance of the template" do
    expect_any_instance_of(MiniChef::Template).to receive(:foo)
    template = proxy.template "path_to_file" do
      foo
    end
  end
end
