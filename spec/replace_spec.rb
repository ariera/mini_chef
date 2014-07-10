require 'spec_helper'
require 'tempfile'

describe MiniChef::Replace, "DSL" do
  let(:replace) { MiniChef::Replace.new(anything) }

  it "sets the attributes following the DSL" do
    replace.instance_eval do
      what  "what"
      with  "with"
    end
    expect(replace.what).to      eq("what")
    expect(replace.with).to      eq("with")
  end
end

describe MiniChef::Replace, "#execute" do
  let(:replace) { MiniChef::Replace.new(anything) }

  it "changes the content of a file" do
    tmp = Tempfile.new('foobar')
    tmp.write("$myvar=foo\n$myotherbar=blabla")
    tmp.close
    replace_command = MiniChef::Replace.new(tmp.path)
    replace_command.what(/^\$myvar.*$/)
    replace_command.with("$myvar=bar")
    replace_command.execute
    tmp.open
    tmp.rewind
    expect(tmp.read).to eq("$myvar=bar\n$myotherbar=blabla")
    tmp.close
    tmp.unlink # destroy tmp file
  end
end
