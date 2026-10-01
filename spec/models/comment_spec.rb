require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'columns' do
    it { is_expected.to have_db_column(:id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:comments).of_type(:text) }
    it { is_expected.to have_db_column(:like_total).of_type(:integer) }
    it { is_expected.to have_db_column(:dislike_total).of_type(:integer) }
    it { is_expected.to have_db_column(:review_id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:user_id).of_type(:integer).with_options(null: false) }
  end
end
