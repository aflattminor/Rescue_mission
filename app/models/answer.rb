class Answer <ApplicationRecord

  belongs_to :question

  validates :answer, presence: true, length: {minimum: 50}

end
