class Item < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "https://scontent-sjc2-1.xx.fbcdn.net/hphotos-xtp1/v/t1.0-9/12043160_10152978231381261_2152549155616654743_n.jpg?oh=45b7baa680d0d76d9d4aeb925e8ab1cf&oe=5685FC19"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def copy_item(user_id, name, description, category, image)
  	Item.create(user_id: user_id, name: name, description: description, category: category, image: image)
  end

  def self.by_category(category)
  	where(category: category)
  end

end
