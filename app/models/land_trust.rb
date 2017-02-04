# == Schema Information
#
# Table name: land_trusts
#
#  id         :uuid             not null, primary key
#  name       :string           not null
#  website    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class LandTrust < ApplicationRecord
  has_many :users
end
