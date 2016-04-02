require 'spec_helper'

describe Movie do
  describe 'searching similar directors' do
    it 'should call Movie with director' do
      Movie.should_receive(:similar_directors).with('Chauranga')
      Movie.similar_directors('Chauranga')
    end
  end
end
