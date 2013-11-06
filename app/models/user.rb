class User < ActiveRecord::Base
  before_create :create_role

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username

  has_many :users_roles, dependent: :destroy
  has_many :roles, through: :users_roles
  has_many :ads, dependent: :destroy

  # Может объединить?
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  # Правильно ли здесь использовать знак вопроса?
  def role?(role)
    self.roles.find_by_name(role)
  end

  private
    def create_role
      self.roles << Role.find_by_name(:user)  #if ENV["RAILS_ENV"] != 'test'
    end

end
