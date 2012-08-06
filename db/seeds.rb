# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
require 'authlogic'

User.create(:username => 'administrator', :first_name => 'admin', :password => 'admin', :password_confirmation => 'admin', :last_name => 'admin', :email => 'nitinbarai.virtueinfo@gmail.com', :mobile_number => '9033194939', :is_admin => 1, :is_active => 1)
