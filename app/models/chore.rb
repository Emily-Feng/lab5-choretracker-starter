class Chore < ApplicationRecord

    # Relationships
    belongs_to :child
    belongs_to :task

    # Validations
    validates_date :due_on

    # Scopes
    scope :by_task, -> { joins(:task).order('tasks.name') }
    scope :chronological, -> { order('due_on') }
    scope :pending, -> { where(completed: false) }
    scope :done, -> { where(completed: true) }
    scope :upcoming, -> { where("due_on >= ?", Date.current) }
    scope :past, -> { where("due_on < ?", Date.current) }
    
    # Methods
    def status
        return "Completed" unless !self.completed

        "Pending"
    end

end
