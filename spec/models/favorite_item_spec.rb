require 'rails_helper'

RSpec.describe FavoriteItem, type: :model do
  describe 'columns' do
    it { is_expected.to have_db_column(:id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:favoritable_type).of_type(:string).with_options(null: false, limit: 255) }
    it { is_expected.to have_db_column(:favoritable_id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:item_type).of_type(:string).with_options(limit: 255) }
    it { is_expected.to have_db_column(:value).of_type(:text) }
  end
end
