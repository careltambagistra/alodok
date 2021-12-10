class Auth < ApplicationRecord
    validates :name, presence: true
    validates :phone, presence: true, uniqueness: true, numericality: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

    has_secure_password

end
