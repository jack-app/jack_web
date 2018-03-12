class Member < ApplicationRecord
  before_save { email.downcase! }

  has_many :skills, dependent: :destroy
  has_many :sns_links, dependent: :destroy
  has_many :member_products, dependent: :destroy
  has_many :products, through: :member_products
  has_many :entries
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :university, presence: true
  validates :password, presence: true, allow_nil: true

  def grade
    enroll = self.enroll
    today = Date.today
    grade = 0
    loop {
      grade += 1
      enroll = enroll.next_year
      if today<enroll
        break;
      end
    }
    grade -= self.repeat
    if grade < 1 then grade = 1 end
    if  (grade > 2 && university.match(/大学院/)) ||
        (grade > 4 && university.match(/大学/) && !university.match(/医学科/)) ||
        (grade > 6 && university.match(/大学/) && university.match(/医学科/)) ||
        (grade > 2 && university.match(/短期大学/))
      "卒業"
    else
      "#{(grade)}年"
    end
  end
end
