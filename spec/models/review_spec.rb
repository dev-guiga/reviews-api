require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'columns' do
    it { is_expected.to have_db_column(:id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:name).of_type(:string).with_options(null: false, limit: 255) }
    it { is_expected.to have_db_column(:description).of_type(:string).with_options(limit: 255) }
    it { is_expected.to have_db_column(:review_type).of_type(:enum).with_options(null: false) }
    it { is_expected.to have_db_column(:overall_review).of_type(:integer) }
    it { is_expected.to have_db_column(:main_review).of_type(:text) }
    it { is_expected.to have_db_column(:like_total).of_type(:integer) }
    it { is_expected.to have_db_column(:dislike_total).of_type(:integer) }
    it { is_expected.to have_db_column(:user_id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:recommended).of_type(:boolean) }
    it { is_expected.to have_db_column(:recommended_for).of_type(:enum) }
    it { is_expected.to have_db_column(:spoiler).of_type(:boolean) }
    it { is_expected.to have_db_column(:discarded_at).of_type(:datetime) }
  end
end
