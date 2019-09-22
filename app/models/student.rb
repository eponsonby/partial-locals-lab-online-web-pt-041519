# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(search_for)
    array = []
    if search_for == ""
      self.all
    else
      self.all.each do |student|
        if student.name.downcase.include?(search_for.downcase)
          array << student
        end
      end
      array
    end
  end

end
