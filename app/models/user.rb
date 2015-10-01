class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :items
  has_attached_file :avatar, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" }, default_url: "http://www.newsmax.com/Newsmax/files/e5/e5d3812c-214e-4cfa-9f8a-4a0c5a548630.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
