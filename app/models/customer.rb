class Customer < ActiveRecord::Base

  has_many :addresses, :as => :addressable

  validates :first_name, :last_name, :presence => true

  # scope :client, lambda {|client| where("client_id = ?", client) }
  scope :by_last_name, lambda { |q| where("last_name ilike '?'", q) }
  # scope :red, where(:color => 'red')
  # scope :xmen, where(last_name: 'smith')
  # scope :by_district_names, lambda { |district_names|
  #   where(['district IN (?)', district_names] )
  # }
# mbda { |q| where("name like :q", q: "%#{q}%") }

end
