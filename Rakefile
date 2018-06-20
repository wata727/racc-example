task :test do
  sh "racc", "-v", "-o", "lib/parser.rb", "lib/parser.y"
  sh "ruby", "-Ilib", "test/parser_test.rb"
end
