class Ad < ActiveRecord::Base
  # FIX: Dangerous
  attr_accessible :title, :body, :type_id, :user_id,
                    :state, :state_event, :status
  #validates_presence_of :name, :state


  state_machine :initial => :draft do # Задание изначального состояния
      event :send_manager do  # Задание события
        transition :draft => :new # Смена состояния на событие
      end

      event :refuse do
        transition :new => :draft
      end

      event :approve do
        transition :new => :approved
      end

      event :publish do
        transition :approved => :published
      end

      event :end do
        transition :published => :archive
      end

      event :return do
            transition :archive => :draft
      end


    end










  belongs_to :type
  belongs_to :user



end
