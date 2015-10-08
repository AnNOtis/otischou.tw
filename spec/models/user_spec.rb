RSpec.describe User do
  context 'columns' do
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:email).of_type(:string) }
    it { should have_secure_password }
  end

  context 'associations' do
    it { should have_many(:articles) }
  end
end
