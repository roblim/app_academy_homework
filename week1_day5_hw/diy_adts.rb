class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack.push(el)
  end

  def remove
    @stack.pop
  end

  def show
    p @stack
  end

end

x = Stack.new
x.show
x.add(1)
x.add(2)
x.show
x.remove
x.add(343)
x.show
