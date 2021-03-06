class User < ActiveRecord::Base
  has_secure_password
  has_many :tweets

  def slug
    username.downcase.gsub(' ', '-')
  end

  def self.find_by_slug(slug)
    self.all.detect{|a| a.username.downcase.gsub(' ', '-') == slug}
  end
end
