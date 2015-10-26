class User < ActiveRecord::Base
 
  before_save :default_values

  has_secure_password

  validates_presence_of :name, :email
  # quite el password
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :phone, numericality: { only_integer: true }, length: { minimum: 10 }

  validates :email, :name, uniqueness: true
  #validates :name, length: { minimum: 4 }
   has_many :products

  # def active?
  #    self.status == 'Activo'
  # end
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def self.based_in_merchant(current)
    current.admin? ? User.order(:store_id).all : User.where(store_id: current.store.id)
  end

  #def admin?
    #role == 'Administrador'
  #end

  private

  def default_values
    #self.role ||= 'Usuario'
    self.status ||= 'Activo'
  end
end


