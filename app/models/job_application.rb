# == Schema Information
#
# Table name: job_applications
#
#  id              :bigint           not null, primary key
#  user_id         :bigint           not null
#  job_offer_id    :bigint           not null
#  status          :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  viewed_by_admin :boolean
#  default         :string
#  false           :string
#
class JobApplication < ApplicationRecord
  belongs_to :user
  belongs_to :job_offer
end
