#Модель для пользователя
class User < ActiveRecord::Base
  #Связи
  has_many :list_elements, dependent: :destroy
  #Поля и доступ к ним
  attr_accessible :name, :password, :password_confirmation
  #Перед сохранением переводим в нижний регистр имя
  before_save { self.name = name.downcase }
  before_create :create_remember_token
  #Валидаторы
  validates(:name, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false })
  has_secure_password
  validates :password, length: { minimum: 6 }
  #Создание токена
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end
  #Дешифрация
  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  #Для фида
  def feed
    ListElement.where("user_id = ?", id)
  end
  
  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end