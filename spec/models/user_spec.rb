require 'spec_helper'

describe User do
  describe "#valid?" do
    it { should allow_value("simon@example.org").for(:email) }
    it { should_not allow_value("not_an_email").for(:email) }
  end
end
