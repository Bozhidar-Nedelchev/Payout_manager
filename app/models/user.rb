class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  def admin?
    # Implement your logic to check if the user is an admin.
    # For example, if you have an "admin" column in your users table:
    admin
  end
  def sales?
    sales_role
  end
end
