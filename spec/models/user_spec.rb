require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'columns' do
    it { is_expected.to have_db_column(:id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:name).of_type(:string).with_options(null: false, limit: 255) }
    it { is_expected.to have_db_column(:username).of_type(:string).with_options(null: false, limit: 255) }
    it { is_expected.to have_db_column(:bio).of_type(:text) }
    it { is_expected.to have_db_column(:phone_number).of_type(:string).with_options(limit: 255) }
  end
end
