class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum role: {team_member: 0, admin: 1}
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :notes

def user_params
  devise_parameter_sanitizer.permit(:sign_up)  { |u| u.permit(  :email, :password, :password_confirmation, :role ) }
end

end
