class Ad < ActiveRecord::Base
  # FIX: Dangerous and clear
  attr_accessible :title, :body, :type_id, :user_id, :type,
                  :state, :state_event, :status, :name,
                  :images, :images_attributes, :_destroy
  attr_accessor :_destroy


  validates :title, :body, :state, presence: true

  has_many :images
  belongs_to :type
  belongs_to :user
  accepts_nested_attributes_for :images, :reject_if => lambda { |a| a[:name].blank? }, allow_destroy: true

  
  UNRANSACKABLE_ATTRIBUTES = ['body', 'status', 'id', 
    'type_id', 'user_id', 'created_at', 'state' ]

  def self.ransackable_attributes auth_object = nil
    (column_names - UNRANSACKABLE_ATTRIBUTES) + _ransackers.keys
  end

  def self.with_type
    joins(:type).select('ads.*, types.name as type_name')
  end



  state_machine :initial => :draft do # Задание изначального состояния
      state :approve, :human_name => 'Added'

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

end
