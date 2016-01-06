class CreateUser < ActiveRecord::Migration
  def self.up
    User.create :email => 'bschagas@webredonda.com.br', :password => '12345678', :name => 'Bruno', :surname => 'Chagas', :avatar => '', :birthday => '1984-01-11', :ocupation => 'Designer', :phone => '(61) 8198-0007', :autorization => true

    User.create :email => 'david@webredonda.com.br', :password => '12345678', :name => 'David', :surname => 'Leandro', :avatar => '', :birthday => '1992-01-21', :ocupation => 'Programmer', :phone => '(61) 9156-7945', :autorization => true
  end
end
