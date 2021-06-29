require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'associations' do
    it { should belong_to(:user).class_name('User') }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    # it { should validate_uniqueness_of(:name).scoped_to(:category_id) }
  end
end
