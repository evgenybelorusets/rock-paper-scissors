require 'rails_helper'

RSpec.describe Result do
  let(:sign_stub) { double :sign_stub }
  let(:submitted_sign) { double :submitted_sign }
  subject { described_class.new submitted_sign }

  before :each do
    stub_const('Sign', sign_stub)
  end

  context 'constants' do
    it { expect(described_class::TIE).to eql :tie }
    it { expect(described_class::LOSS).to eql :loss }
    it { expect(described_class::WIN).to eql :win }

    context 'outcomes' do
      before :each do
        stub_const("#{described_class}::TIE", :tie)
        stub_const("#{described_class}::LOSS", :loss)
        stub_const("#{described_class}::WIN", :win)

        it { expect(described_class::OUTCOMES).to eql(0 => :tie, 1 => :win, -1 => :loss) }
      end
    end
  end

  describe "#generated_sign" do
    let(:random_sign) { double :random_sign }

    it 'should return random sign' do
      allow(sign_stub).to receive(:random).once.and_return random_sign
      expect(subject.generated_sign).to eql random_sign
      expect(subject.generated_sign).to eql random_sign
    end
  end

  describe '#outcome' do
    let(:generated_sign) { double :generated_sign }

    before :each do
      allow(subject).to receive(:generated_sign).and_return generated_sign
      stub_const("#{described_class}::OUTCOMES", 0 => :tie, 1 => :win, -1 => :loss)
    end

    it 'should return loss in submitted sign is worse' do
      allow(submitted_sign).to receive(:<=>).with(generated_sign).and_return -1
      expect(subject.outcome).to eql :loss
    end

    it 'should return win if submitted sign is better' do
      allow(submitted_sign).to receive(:<=>).with(generated_sign).and_return 1
      expect(subject.outcome).to eql :win
    end

    it 'should return tie if sings are equal' do
      allow(submitted_sign).to receive(:<=>).with(generated_sign).and_return 0
      expect(subject.outcome).to eql :tie
    end
  end
end
