require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'associations' do
    it { should belong_to(:user).class_name('User') }
    it { should belong_to(:article).class_name('Article') }

  end

  describe 'validations' do
    it { should validate_presence_of(:description) }
  end
end
