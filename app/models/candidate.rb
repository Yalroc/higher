class Candidate < ApplicationRecord
  has_many :job_applications
  has_many :job_offers, through: :job_applications
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
