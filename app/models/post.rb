class Post < ActiveRecord::Base
  # validates :date, presence: { :message => 'Date cannot be blank' }

  # validates :title, presence: { :message => 'Title cannot be blank' }

  # validates :organizer_name, presence: { :message => 'Organizer Name cannot be blank' }

  # validates_format_of :organizer_email, :with => /\w+[@]\w{2,}[.]\w{2,}/, :message => "Invalid Email"

  # validate :date_not_in_past

  # def date_not_in_past
  #   errors.add(:date, "Date cannot be in the past") if !date.nil? && date < Date.today
  # end

  belongs_to :category
end
