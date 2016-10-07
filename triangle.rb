# coding: utf-8
# frozen_string_literal: true
class TriangleTypeDetector
  def self.run(*args)
    return false unless args.any? { |x| x.is_a? Numeric }
    return '三角形じゃないです＞＜' unless triangle?(*args)
    return '正三角形ですね！' if regular_triangle?(*args)
    return '二等辺三角形ですね！' if isosceles_triangle?(*args)
    '不等辺三角形ですね！'
  end

  def self.triangle?(*args)
    return false unless args.size == 3
    return false unless args.all? { |x| x.is_a? Numeric }
    a, b, c = args.map(&:to_i)
    a + b > c &&
      b + c > a &&
      a + c > b
  end

  def self.isosceles_triangle?(*args)
    triangle?(*args) && args.uniq.size == 2
  end

  def self.regular_triangle?(*args)
    triangle?(*args) && args.uniq.size == 1
  end

  private_class_method :triangle?, :isosceles_triangle?, :regular_triangle?
end

print TriangleTypeDetector.run(*ARGV.map(&:to_i)) if ARGV.size.positive?
