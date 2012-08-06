class UserMailer < ActionMailer::Base
  default :from => "ryan@railscasts.com"
  
  def registration_confirmation(user, body)
    @user = user
    mail(:to => "#{user.username} <#{user.email}>", :subject => "CouponMandi::New registration", :body => body, :content_type => "text/html")
  end

  def forgot_password_confirmation(user,new_pass, body)
    #attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
    mail(:to => "#{user.username} <#{user.email}>", :subject => "CouponMandi::Password Reset", :body => body, :content_type => "text/html")
  end

  def get_coupon_confirmation(user,coupon, body)
    mail(:to => "#{user.username} <#{user.email}>", :subject => "Your coupon code info for Coupon Mandi", :body => body, :content_type => "text/html")
  end

end


