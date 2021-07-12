require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'Associations' do
    it { should belong_to(:user) }
    it { should belong_to(:category) }
  end
end
