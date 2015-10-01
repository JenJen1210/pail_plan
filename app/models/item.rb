class Item < ActiveRecord::Base
  belongs_to :user

  def copy_item(user_id, name, description, category)
  	Item.create(user_id: user_id, name: name, description: description, category: category)
  end

  def categories

  end

end
