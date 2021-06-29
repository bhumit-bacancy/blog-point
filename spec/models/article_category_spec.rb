require 'rails_helper'

RSpec.describe ArticleCategory, type: :model do
  describe 'associations' do
    it { should belong_to(:article).class_name('Article') }
    it { should belong_to(:category).class_name('Category') }
  end
end
