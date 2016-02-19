require 'rails_helper'

RSpec.describe Sign do
  context 'class methods' do
    describe '#random' do
      it 'should return valid sign' do
        expect(described_class.random).to be_kind_of(described_class)
      end
    end
  end

  context 'constants' do
    it { expect(described_class::ROCK).to eql 'rock' }
    it { expect(described_class::PAPER).to eql 'paper' }
    it { expect(described_class::SCISSORS).to eql 'scissors' }

    context 'rules' do
      before :each do
        stub_const("#{described_class}::ROCK", 'rock')
        stub_const("#{described_class}::PAPER", 'paper')
        stub_const("#{described_class}::SCISSORS", 'scissors')
      end

      it { expect(described_class::POSSIBLE_SIGNS).to match_array ['rock', 'paper', 'scissors'] }
      it { expect(described_class::RULES).to eql('rock' => 'scissors', 'paper' => 'rock', 'scissors' => 'paper') }
    end
  end
  
  describe '#initialize' do
    before :each do
      stub_const("#{described_class}::POSSIBLE_SIGNS", ['rock', 'paper', 'scissors'])
    end  
    
    it 'should return new sign object if name allowed' do
      expect(described_class.new('rock')).to be_kind_of(described_class)
    end

    it 'should raise error if name not allowed' do
      expect { described_class.new('test').to raise_error(InvalidSignError) }
    end
  end

  describe '#<=>' do
    before :each do
      stub_const("#{described_class}::POSSIBLE_SIGNS", ['rock', 'paper', 'scissors'])
      stub_const("#{described_class}::RULES", 'rock' => 'scissors', 'paper' => 'rock', 'scissors' => 'paper')
    end

    it 'should be 1 if we compare paper to rock' do
      expect(described_class.new('paper') <=> described_class.new('rock')).to eql 1
    end

    it 'should be 1 if we compare rock to scissors' do
      expect(described_class.new('rock') <=> described_class.new('scissors')).to eql 1
    end

    it 'should be 1 if we compare scissors to paper' do
      expect(described_class.new('scissors') <=> described_class.new('paper')).to eql 1
    end

    it 'should be -1 if we compare rock to paper' do
      expect(described_class.new('rock') <=> described_class.new('paper')).to eql -1
    end

    it 'should be -1 if we compare scissors to rock' do
      expect(described_class.new('scissors') <=> described_class.new('rock')).to eql -1
    end

    it 'should be -1 if we compare paper to scissors' do
      expect(described_class.new('paper') <=> described_class.new('scissors')).to eql -1
    end

    it 'should be 0 if we compare rock to rock' do
      expect(described_class.new('rock') <=> described_class.new('rock')).to eql 0
    end

    it 'should be 0 if we compare scissors to scissors' do
      expect(described_class.new('scissors') <=> described_class.new('scissors')).to eql 0
    end

    it 'should be 0 if we compare paper to paper' do
      expect(described_class.new('paper') <=> described_class.new('paper')).to eql 0
    end
  end
end
