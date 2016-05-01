require 'spec_helper'

describe Mitier::Ner do
  let(:text) { File.read './spec/fixtures/obama_speech.txt' }
  subject { EXTRACTOR.process_ner text }

  it('extracts tokens from text') do
    expect(subject.detections.length).to eq 15
  end

  context 'when text for processing nil' do
    subject { EXTRACTOR.process_ner nil }
    it 'sets detections to empty array' do
      expect(subject.detections).to be_empty
    end
    it 'sets tokens to empty array' do
      expect(subject.tokens).to be_empty
    end
  end

  context 'when text for processing empty' do
    subject { EXTRACTOR.process_ner '     ' }
    it 'sets detections to empty array' do
      expect(subject.detections).to be_empty
    end
    it 'sets tokens to empty array' do
      expect(subject.tokens).to be_empty
    end
  end
end
