# == Schema Information
#
# Table name: equipment_categories
#
#  id   :integer          not null, primary key
#  name :string
#  type :string
#

require 'spec_helper'

describe Equipment::Category, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:type) }
  it { is_expected.to have_many(:items) }
end
