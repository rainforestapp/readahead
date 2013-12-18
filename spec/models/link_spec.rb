require 'spec_helper'

describe Link do
  describe "#valid?" do
    it { should allow_value("http://www.google.com").for(:url) }
    it { should_not allow_value("www.google.com").for(:url) }
    it { should_not allow_value("not_a_url").for(:url) }
  end
end
