require_relative "employee"

class Manager < Employee
  #class mgr extends employee
  attr_reader :salary, :name, :title, :children

  def initialize(name, salary, title, boss=nil)
    super
    @children = []
  end

  def total_child_salary
    # base case
    # when child.respond_to?(:total_child_salary) is false
    # recursive step
    # self.salary + sum(children.total_child_salary)
    @salary + @children.inject(0) do |acc, child|
      #base case
      unless child.respond_to?(:total_child_salary)
        child.salary + acc
      else
        child.total_child_salary + acc
      end
    end
  end

  def bonus(multiplier)
    total_child_salary * multiplier
  end
end