require 'spec_helper'

describe Mitier::Extractor do
  subject { described_class.new ENV['TEST_MODEL_PATH'] }
  context 'when model not loaded' do
    it 'raises an exception' do
      expect { subject.process_ner 'Some example text.' }.to(
        raise_error Mitier::Extractor::ModelNotLoaded)
    end
  end
end
