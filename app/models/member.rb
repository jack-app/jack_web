class Member < ApplicationRecord
  has_many :skills
  has_many :sns_links
  has_many :member_products
  has_many :products, through: :member_products
  has_secure_password
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
    "#{(grade)}年"
  end
end
