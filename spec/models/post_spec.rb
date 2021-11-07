require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validation' do
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_presence_of(:image) }
  end

  describe 'association' do
    it { is_expected.to belong_to(:user) }
  end
end
