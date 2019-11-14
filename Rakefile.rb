RUBY_PATH = "C:/Ruby25-x64/bin"
SOLUTION = "E:/rubyProgram/server_time.rb"

RUBY_TEST_PATH = "E:/rubyProgram/tc_server_time.rb"

desc 'all task with the dependency of all of the tasks'
task :all => [:compile, :test]

desc 'compiling the program'
task :compile do
	sh "#{RUBY_PATH}/ruby.exe #{SOLUTION}"
end

desc 'testing the program'
task :test do
	sh "#{RUBY_PATH}/ruby.exe #{RUBY_TEST_PATH}"
end
