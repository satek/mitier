require 'spec_helper'

describe Mitier::Tokenizer do
  let(:text) { File.read './spec/fixtures/obama_speech.txt' }
  subject { described_class.new(text).process }

  it('extracts tokens from text') do
    expect(subject.length).to eq 263
  end

  context 'when text for processing nil' do
    let(:text) { nil }
    it 'returns an empty array' do
      is_expected.to be_empty
    end
  end

  context 'when text for processing empty' do
    let(:text) { '     ' }
    it 'returns an empty array' do
      is_expected.to be_empty
    end
  end
end
