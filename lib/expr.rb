PlusExpr = Struct.new(:lhs, :rhs)
MulExpr = Struct.new(:lhs, :rhs)
LIdentExpr = Struct.new(:name)
SendExpr = Struct.new(:name, :args)
