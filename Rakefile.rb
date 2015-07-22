require 'rake/testtask'

task default: %w[test]

task :test do
  ruby './test/key_test.rb'
  ruby './test/offset_test.rb'
  ruby './test/rotation_test.rb'
  ruby './test/inputdate_test.rb'
  ruby './test/message_test.rb'
  ruby './test/outputfile_test.rb'
  ruby './test/codecracker_test.rb'
  ruby './test/integration_test.rb'
end
