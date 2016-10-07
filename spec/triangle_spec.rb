# coding: utf-8
# frozen_string_literal: true
require_relative '../triangle'

describe TriangleTypeDetector do
  subject { `ruby ./triangle.rb #{params.join(' ')}` }
  context '異常な値の場合' do
    context '0 が含まれる場合' do
      let(:params) { [0, 1, 1] }
      it { is_expected.to eq '三角形じゃないです＞＜' }
    end

    context '負数が含まれる場合' do
      let(:params) { [1, -1, 1] }
      it { is_expected.to eq '三角形じゃないです＞＜' }
    end

    context '引数が 3 つでない場合' do
      let(:params) { [1, 1, 1, 1] }
      it { is_expected.to eq '三角形じゃないです＞＜' }
    end
  end

  context '三角形じゃないとき' do
    let(:params) { [1, 2, 3] }
    it { is_expected.to eq '三角形じゃないです＞＜' }
  end

  context '正三角形のとき' do
    let(:params) { [1, 1, 1] }
    it { is_expected.to eq '正三角形ですね！' }
  end

  context '二等辺三角形のとき' do
    let(:params) { [2, 2, 1] }
    it { is_expected.to eq '二等辺三角形ですね！' }
  end

  context '不等辺三角形のとき' do
    let(:params) { [2, 3, 4] }
    it { is_expected.to eq '不等辺三角形ですね！' }
  end
end
