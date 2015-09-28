class User < ActiveRecord::Base
  has_secure_password
  validates :user_name, :password_digest, presence: true
  validates :user_name, length: {in: 4..10}
  validates :user_name, uniqueness: true
  validates :password_digest, length: {in: 4..6}
  validates :role, inclusion: {in: %w(team judge admin)}

  enum role: [:team, :judge, :admin]
end