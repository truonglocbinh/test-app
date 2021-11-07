require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validation' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'association' do
    it { should have_many(:posts) }
  end
end
