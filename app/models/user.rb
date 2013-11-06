class User < ActiveRecord::Base
  before_create :create_role

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username

  belongs_to :role
  has_many :ads, dependent: :destroy

  # Может объединить?
  # Добавить валидацию на длину
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  # Правильно ли здесь использовать знак вопроса?
  def role?(role)
    return false unless self.role  # нужно ли
    self.role.name.to_sym == (role)
  end

  private
    def create_role
      self.role = Role.find_by_name(:user)  #if ENV["RAILS_ENV"] != 'test'
    end

end
