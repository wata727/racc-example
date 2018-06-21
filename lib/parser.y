class MyParser

rule

  expr: INT                 { result = val[0] }
      | expr PLUS expr      { result = PlusExpr.new(val[0], val[2]) }
      | expr MUL expr       { result = MulExpr.new(val[0], val[2]) }
      | LPAREN expr RPAREN  { result = val[1] }
      | LIDENT              { result = LIdentExpr.new(val[0]) }
      | SEND args           { result = SendExpr.new(val[0], val[1]) }

  args: expr                { result = [val[0]] }
      | args COMMA expr     { result = val[0] + [val[2]] }

---- inner

attr_reader :input

def initialize(input)
  @input = StringScanner.new(input)
end

def self.parse(string)
  self.new(string).do_parse
end

def next_token
  case
  when input.eos?
    [false, false]
  when input.scan(/,/)
    [:COMMA, nil]
  when input.scan(/\s+/)
    next_token
  when input.scan(/\(/)
    [:LPAREN, nil]
  when input.scan(/\)/)
    [:RPAREN, nil]
  when input.scan(/\+/)
    [:PLUS, nil]
  when input.scan(/\*/)
    [:MUL, nil]
  when input.scan(/\d+/)
    [:INT, input.matched.to_i]
  when input.scan(/[A-Z][a-z]*/)
    [:SEND, input.matched.to_sym]
  when input.scan(/[a-z]/)
    [:LIDENT, input.matched.to_sym]
  end
end
