class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  has_many :event_invites, dependent: :destroy
  has_many :events, through: :event_invites  
  has_one :user_profile, dependent: :destroy
  validates_presence_of :name
  validates_uniqueness_of :email, :case_sensitive => false
end
