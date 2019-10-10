class Problem < ActiveRecord::Base
  belongs_to :user

  validates :title, :description, presence: true
end

# <% if flash.has?(:err) %>
#   <h3 style="color: red;"><%= flash[:err] %></h3>
# <% end %>
