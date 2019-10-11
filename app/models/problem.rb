class Problem < ActiveRecord::Base
  belongs_to :user

  validates :title, :description, presence: { message: "Title and or Description fields can't be empty Bud!"}
end

# <% if flash.has?(:err) %>
#   <h3 style="color: red;"><%= flash[:err] %></h3>
# <% end %>
