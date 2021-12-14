require 'rails_helper'

describe MovieActor do
  describe 'relationships' do
    it { should belong_to :movie }
    it { should belong_to :actor }
  end
end