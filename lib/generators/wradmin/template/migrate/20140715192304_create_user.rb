class CreateUser < ActiveRecord::Migration
  def self.up
    User.create :email => 'bschagas@grupogladium.com.br', :password => '12345678', :name => 'Bruno', :surname => 'Chagas', :avatar => '', :birthday => '1984-01-11', :ocupation => 'Designer', :phone => '(61) 8198-0007', :autorization => true

    User.create :email => 'david.leandro@grupogladium.com.br', :password => '12345678', :name => 'David', :surname => 'Leandro', :avatar => '', :birthday => '1992-01-21', :ocupation => 'Programmer', :phone => '(61) 9156-7945', :autorization => true

    User.create :email => 'juliana.cid@grupogladium.com.br', :password => '12345678', :name => 'Juliana', :surname => 'Cid', :avatar => '', :birthday => '1990-10-12', :ocupation => 'Redactora', :phone => '(61) 9298-2027', :autorization => true

    User.create :email => 'axbarros@grupogladium.com.br', :password => '12345678', :name => 'Alexandre', :surname => 'Barros', :avatar => '', :birthday => '1981-05-04', :ocupation => 'The boss', :phone => '(61) 8413-9474', :autorization => true
  end
end
