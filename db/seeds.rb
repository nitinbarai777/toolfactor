# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
require 'authlogic'

User.create(:username => 'administrator', :first_name => 'admin', :password => 'admin', :password_confirmation => 'admin', :last_name => 'admin', :email => 'nitin.barai777@gmail.com', :mobile_number => '9033194939', :is_admin => 1, :is_active => 1)

for i in 1..5
	name = 'Tool-' + i.to_s
	Tool.create(:name => name, :description => name)
end

for i in 1..24
	name = 'Factor-' + i.to_s
	Factor.create(:name => name)
end

Age.create(:name => '18-23')
Age.create(:name => '23-27')
Age.create(:name => '27-35')
Age.create(:name => '40+')

