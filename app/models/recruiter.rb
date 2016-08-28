class Recruiter < ApplicationRecord
  belongs_to :organization, required: false
  has_many :job_offers
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # devise :omniauthable, omniauth_providers: [:linkedin]
end
