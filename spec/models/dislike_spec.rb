require 'rails_helper'

RSpec.describe Dislike, type: :model do
  describe 'associations' do
    it { should belong_to(:user).class_name('User') }
    it { should belong_to(:article).class_name('Article') }
    it { should belong_to(:comment).class_name('Comment') }
  end
end
