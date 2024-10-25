# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  experience_years       :integer
#  education_level        :string
#  previous_positions     :text
#  role                   :integer          default("normal_user")
#  name                   :string
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { normal_user: 0, admin: 1 }

  # Establecer el valor por defecto del role
  after_initialize :set_default_role, if: :new_record?

  has_many :job_applications, dependent: :destroy
  has_one_attached :image_profile

# Validaciones para el registro
validates :name, presence: true, length: { maximum: 50 }
validates :email, presence: true

# Validaciones condicionales para la actualización del perfil
validates :experience_years, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :education_level, presence: true, on: :update

private

  def set_default_role
    self.role ||= :normal_user
  end
end
