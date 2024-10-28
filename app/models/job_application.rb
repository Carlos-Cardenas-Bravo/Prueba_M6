# == Schema Information
#
# Table name: job_applications
#
#  id           :bigint           not null, primary key
#  user_id      :bigint           not null
#  job_offer_id :bigint           not null
#  status       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  checked      :boolean          default(FALSE)
#
class JobApplication < ApplicationRecord
  belongs_to :user
  belongs_to :job_offer

  # Validaciones
  validates :status, presence: true

  # Obtener todas las postulaciones no revisadas
  scope :unchecked, -> { where(checked: false) }

  # Marcar la postulación como revisada
  def mark_as_checked!
    update(checked: true)
  end
end
