require 'spec_helper'

describe MiniChef::Template, "DSL" do
  let(:template) { MiniChef::Template.new(anything) }

  it "sets the attributes following the DSL" do
    template.instance_eval do
      source "path_to_template"
      owner  "owner"
      group  "group"
      mode   "mode"
      variables ({
        bar:"123"
      })
    end
    expect(template.source).to     eq("path_to_template")
    expect(template.owner).to      eq("owner")
    expect(template.group).to      eq("group")
    expect(template.mode).to       eq("mode")
    expect(template.variables).to  eq({bar:"123"})
  end

end

describe MiniChef::Template, "#execute" do
  let(:destination) { File.join(GEM_TMP_DIR, "example.conf") }
  let(:source)      { File.join(GEM_TEST_FILES, "example.conf.erb")}
  let(:template) do
    template= MiniChef::Template.new(destination)
    template.variables({bar:"123"})
    template
  end

  it "outputs the compiled template to the desired destination", :cleanup do
    template.source source
    template.execute
    expect(File.file?(destination)).to be true
    compiled_ouput = File.open(destination).read
    expect(compiled_ouput).to include("Foo: 123")
  end

  it "overwrites the destination file if it already existed", :cleanup do
    FileUtils.touch(destination)
    template.source source
    template.execute
    compiled_ouput = File.open(destination).read
    expect(compiled_ouput).to include("Foo: 123")
  end

  it "creates the path to the destination file if needed", :cleanup do
    non_existent_destination = File.join(GEM_TMP_DIR, "non-existent-directory", "example.conf")
    template.destination = non_existent_destination
    template.source source
    template.execute
    expect(File.file?(non_existent_destination)).to be true
  end

  # it "tests this just in my computer, just to know that it works before we figure a proper way to test it", :cleanup do
  #   template.owner "fsainz"
  #   template.group "everyone"
  #   template.mode 0600
  #   template.source source
  #   template.execute
  #   binding.pry
  # end

  pending "test MODE"

  pending "test OWNER"

  pending "test GROUP"


  # FIX: the line
  #       template.variables {bar:123}
  # doesn't work, probably by conflicts with the named parameters conventions
  pending "template variables shouldn't need to be surrounded by paranthesis"

end
