require 'spec_helper'

describe Link do
  describe "#valid?" do
    it { should allow_value("http://www.google.com").for(:url) }
    it { should_not allow_value("www.google.com").for(:url) }
    it { should_not allow_value("not_a_url").for(:url) }
  end

  describe Link::Representation do
    let(:url) { 'https://news.ycombinator.com/' }

    subject do
      Link::Representation.new(url)
    end

    it 'should be available for a URL' do
      expect{subject}.to_not raise_error
    end

    ['title', 'word_count', 'author', 'domain'].each do |property|
      it "has method #{property}" do
        expect(subject.public_methods).to include(property.to_sym)
      end
    end
  end
end