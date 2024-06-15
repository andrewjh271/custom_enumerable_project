module Enumerable
  def my_all?(&block)
    self.my_each { |i| return false unless yield i }
    true
  end

  def my_any?(&block)
    self.my_each { |i| return true if yield i } 
    false
  end

  def my_count(&block)
    count = 0
    if block_given?
      self.my_each { |i| count += 1 if yield i }
    else
      self.my_each { count += 1 }
    end
    count
  end

  def my_each_with_index(&block)
    count = 0
    self.my_each do |i|
      yield [i, count]
      count += 1
    end
  end

  def my_inject(acc, &block)
    self.my_each { |i| acc = yield [i, acc] }
    acc
  end

  def my_map(&block)
    arr = []
    self.my_each { |i| arr << (yield i) }
    arr
  end

  def my_none?(&block)
    self.my_each { |i| return false if yield i }
    true
  end

  def my_select(&block)
    arr = []
    self.my_each { |i| arr << i if yield i }
    arr
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each(&block)
    for i in self do
      yield i
    end
  end 
end
