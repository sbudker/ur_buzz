class Attend < ApplicationRecord
  belongs_to :attending, class_name: "Micropost"
  belongs_to :attendee, class_name: "User"
end