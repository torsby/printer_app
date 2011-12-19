class Order < ActiveRecord::Base

validates_presence_of :title, :description, :image
    attr_protected :id,:status, :error_message, :updated_at, :created_at
    attr_accessor :card_type, :card_number,:card_expiration_month, :card_expiration_year, :card_verification_value

    has_many :order_items
    has_many :books, :through => :order_items

    validates_size_of :order_items, :minimum => 1
    validates_length_of :ship_to_first_name, :in => 2..255
    validates_length_of :ship_to_last_name, :in => 2..255
    validates_length_of :ship_to_address, :in => 2..255
    validates_length_of :ship_to_city, :in => 2..255
    validates_length_of :ship_to_postal_code, :in => 2..255
    validates_length_of :ship_to_country, :in => 2..255
    validates_length_of :phone_number, :in => 7..20
    validates_length_of :customer_ip, :in => 7..15
    validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
    validates_inclusion_of :status, :in => %w(open processed closed failed)
    validates_inclusion_of :card_type, :in => ['Visa', 'MasterCard', 'Discover'],:on => :create
    validates_length_of :card_number, :in => 13..19, :on => :create
    validates_inclusion_of :card_expiration_month,:in => %w(1 2 3 4 5 6 7 8 9 10 11 12), :on => :create
    validates_inclusion_of :card_expiration_year,:in => %w(2006 2007 2008 2009 2010), :on => :create
    validates_length_of :card_verification_value, :in => 3..4, :on => :create

  def total
    order_items.inject(0) {|sum, n| n.price * n.amount + sum}
  end
end


