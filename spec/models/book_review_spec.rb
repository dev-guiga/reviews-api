require 'rails_helper'

RSpec.describe BookReview, type: :model do
  describe 'columns' do
    it { is_expected.to have_db_column(:id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:reading_difficulty).of_type(:enum) }
    it { is_expected.to have_db_column(:story_rating).of_type(:integer) }
    it { is_expected.to have_db_column(:characters_rating).of_type(:integer) }
    it { is_expected.to have_db_column(:pacing_rating).of_type(:integer) }
    it { is_expected.to have_db_column(:ending_rating).of_type(:integer) }
    it { is_expected.to have_db_column(:themes_rating).of_type(:string).with_options(limit: 255) }
    it { is_expected.to have_db_column(:review_id).of_type(:integer) }
    it { is_expected.to have_db_column(:metadata).of_type(:json) }
    it { is_expected.to have_db_column(:external_id).of_type(:string).with_options(limit: 255) }
  end
end
