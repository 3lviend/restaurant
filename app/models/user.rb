class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :role
#  validates :name, length: { minimum: 2 }
  # validates_presence_of :password, :email
  validates :password, length: { minimum: 6}
  # validates :email, uniqueness: true
end
