require 'bundler/setup'
Bundler.setup

require 'mini_chef'
require 'pry'

GEM_ROOT       = File.dirname __dir__ #ruby 2
GEM_TMP_DIR    = File.join(GEM_ROOT, "spec", "tmp")
GEM_TEST_FILES = File.join(GEM_ROOT, "spec", "test_files")


RSpec.configure do |config|
  config.before(:all) do
    FileUtils.mkdir_p GEM_TMP_DIR
  end
  config.after(:all) do
    FileUtils.rm_rf("#{GEM_TMP_DIR}/.")
  end

  config.before(:example, :cleanup) do
    FileUtils.rm_rf("#{GEM_TMP_DIR}/.")
    FileUtils.mkdir_p GEM_TMP_DIR
  end
end
