RSpec.describe Article do
  context 'columns' do
    it { should define_enum_for(:status).with([:draft, :publish, :deleted]) }
    it { should have_db_column(:title).of_type(:string) }
    it { should have_db_column(:content).of_type(:text) }
    it { should have_db_column(:slug).of_type(:text) }
  end

  context 'associations' do
    it { should belong_to(:author).class_name(:user) }
    it { should have_many(:tags) }
  end
end
