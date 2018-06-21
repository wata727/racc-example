require "expr"
require "parser"
require "stringio"
require "strscan"

require "minitest/autorun"

class HelloTest < Minitest::Test
    def test_1
        expr = MyParser.parse("1 + 2")
        expr = MyParser.parse("1 + 2 + 3")
	puts MyParser.parse("Meow 1+2")
    end
end
