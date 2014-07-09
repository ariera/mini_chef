require 'spec_helper'


describe MiniChef::DSL do
  let(:dsl) { MiniChef::DSL.new }

  describe "#template" do
    before(:each) do
      allow_any_instance_of(MiniChef::Template).to receive(:execute)
    end

    it "creates a template pointing to the desired destination" do
      template = dsl.template "path_to_file"
      expect(template).to be_a(MiniChef::Template)
      expect(template.destination).to eq("path_to_file")
    end

    it "evaluates its given block within the instance of the template" do
      expect_any_instance_of(MiniChef::Template).to receive(:foo)
      template = dsl.template anything do
        foo
      end
    end

    it "executes the template" do
      expect_any_instance_of(MiniChef::Template).to receive(:execute)
      template = dsl.template anything
    end
  end



  describe "#directory" do
    before(:each) do
      allow_any_instance_of(MiniChef::Directory).to receive(:execute)
    end

    it "creates a directory pointing to the desired destination" do
      directory = dsl.directory "path_to_dir"
      expect(directory).to be_a(MiniChef::Directory)
      expect(directory.destination).to eq("path_to_dir")
    end

    it "evaluates its given block within the instance of the directory" do
      expect_any_instance_of(MiniChef::Directory).to receive(:foo)
      directory = dsl.directory anything do
        foo
      end
    end

    it "executes the directory" do
      expect_any_instance_of(MiniChef::Directory).to receive(:execute)
      directory = dsl.directory anything
    end
  end


end
