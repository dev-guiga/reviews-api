require 'rails_helper'

RSpec.describe ReactionComment, type: :model do
  describe 'columns' do
    it { is_expected.to have_db_column(:id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:reaction).of_type(:boolean) }
    it { is_expected.to have_db_column(:comment_id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:user_id).of_type(:integer).with_options(null: false) }
  end
end
