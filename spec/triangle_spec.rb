# coding: utf-8
# frozen_string_literal: true
require_relative '../triangle'

describe TriangleTypeDetector do
  subject { `ruby ./triangle.rb #{params.join(' ')}` }
  let(:regular_triangle_message) { '正三角形ですね！' }
  let(:isosceles_triangle_message) { '二等辺三角形ですね！' }
  let(:scalene_triangle_message) { '不等辺三角形ですね！' }
  let(:not_triangle_message) { '三角形じゃないです＞＜' }

  context '異常な値の場合' do
    context '0 が含まれる時' do
      let(:params) { [0, 1, 1] }
      it { is_expected.to eq not_triangle_message }
    end

    context '負数が含まれる時' do
      let(:params) { [1, -1, 1] }
      it { is_expected.to eq not_triangle_message }
    end

    context '引数が 3 つでない時' do
      let(:params) { [1, 1, 1, 1] }
      it { is_expected.to eq not_triangle_message }
    end

    context '数値と以外が含まれる時' do
      let(:params) { %w(a b c) }
      it { is_expected.to eq not_triangle_message }
    end
  end

  describe '三角形' do
    context '辺 a + b > c が有てはまる時' do
      let(:params) { [20, 20, 39] } # a, b, c
      example '三角形である' do
        is_expected.to_not eq not_triangle_message
      end
    end

    context '辺 a + b > c が有てはまらない時' do
      let(:params) { [20, 20, 40] }
      example '三角形でない' do
        is_expected.to eq not_triangle_message
      end
    end
    context '辺 b + c > a が有てはまる時' do
      let(:params) { [39, 20, 20] }
      example '三角形である' do
        is_expected.to_not eq not_triangle_message
      end
    end

    context '辺 b + c > a が有てはまらない時' do
      let(:params) { [40, 20, 20] }
      example '三角形でない' do
        is_expected.to eq not_triangle_message
      end
    end
    context '辺 a + c > b が有てはまる時' do
      let(:params) { [20, 39, 20] }
      example '三角形である' do
        is_expected.to_not eq not_triangle_message
      end
    end

    context '辺 a + c > b が有てはまらない時' do
      let(:params) { [20, 40, 20] }
      example '三角形でない' do
        is_expected.to eq not_triangle_message
      end
    end
  end

  describe '正三角形' do
    context '三辺の長さが等しい時' do
      let(:params) { [1, 1, 1] }
      it { is_expected.to eq regular_triangle_message }
    end
    context '全ての辺の長さが等しく無い時' do
      let(:params) { [2, 3, 4] }
      it { is_expected.to_not eq regular_triangle_message }
    end
    context '二辺の長さだけ等しい時' do
      let(:params) { [2, 4, 4] }
      it { is_expected.to_not eq regular_triangle_message }
    end
  end

  describe '二等辺三角形' do
    context '三辺の長さが等しい時' do
      let(:params) { [1, 1, 1] }
      it { is_expected.to_not eq isosceles_triangle_message }
    end
    context '全ての辺の長さが等しく無い時' do
      let(:params) { [2, 3, 4] }
      it { is_expected.to_not eq isosceles_triangle_message }
    end
    context '二辺の長さだけ等しい時' do
      let(:params) { [2, 4, 4] }
      it { is_expected.to eq isosceles_triangle_message }
    end
  end

  describe '不等辺三角形' do
    context '三辺の長さが等しい時' do
      let(:params) { [1, 1, 1] }
      it { is_expected.to_not eq scalene_triangle_message }
    end
    context '全ての辺の長さが等しく無い時' do
      let(:params) { [2, 3, 4] }
      it { is_expected.to eq scalene_triangle_message }
    end
    context '二辺の長さだけ等しい時' do
      let(:params) { [2, 4, 4] }
      it { is_expected.to_not eq scalene_triangle_message }
    end
  end
end
