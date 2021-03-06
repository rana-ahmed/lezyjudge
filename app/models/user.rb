class User < ActiveRecord::Base
  has_many :clarifications, dependent: :destroy
  has_many :submissions, dependent: :destroy
  has_secure_password
  has_many :clarifications, dependent: :destroy
  validates :user_name, :password, :role, presence: true
  validates :user_name, length: {in: 4..10}
  validates :user_name, uniqueness: true
  validates :password, length: {in: 4..6}
  validates :role, inclusion: {in: %w(team judge admin)}

  enum role: [:team, :judge, :admin]
end
