class Schedule < ApplicationRecord
    validates :title, presence: true
    validates :start_date, presence: true
    validates :end_date, presence: true
    validate :error_day?
    def error_day?
        unless start_date == nil || end_date == nil
            errors.add(:end_date, "は開始日時より後にしてください") if start_date > end_date
        end
    end
end
