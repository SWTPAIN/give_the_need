require 'rails_helper'

describe Post do
  it { should belong_to(:user) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  # it { should validate_presence_of(:main_photo)}
end