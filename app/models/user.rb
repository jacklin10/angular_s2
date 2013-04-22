class User < ActiveRecord::Base

  has_many :company_users
  has_many :companies, :through => :company_users

  belongs_to :profile, :polymorphic => true

  accepts_nested_attributes_for :companies

  devise :database_authenticatable, :confirmable, :registerable, :recoverable,
         :rememberable, :trackable, :timeoutable, :validatable, :lockable

  def with_single_company
    self.companies = []
    self.companies.build
    self
  end

end
