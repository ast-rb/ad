class Ad < ActiveRecord::Base
  # FIX: Dangerous and clear
  attr_accessible :title, :body, :type_id, :user_id, :type,
                  :state, :state_event, :name,
                  :images, :images_attributes, :_destroy
  attr_accessor :_destroy

  validates :title, :body, presence: true
  validates :title, length: {minimum: 3}

  has_many :images
  belongs_to :type
  belongs_to :user
  accepts_nested_attributes_for :images, :reject_if => lambda { |a| a[:name].blank? }, allow_destroy: true

  searchkick autocomplete: ['title']

  #def self.mysearch
  #  searchkick autocomplete: ['title']
  #  Ad.search("do", autocomplete: true).map(&:title)
  #end


  def self.with_type
    joins(:type).select('ads.*, types.name as type_name')
  end

  # For Ransack
  UNRANSACKABLE_ATTRIBUTES = ['body', 'status', 'id',
                              'type_id', 'user_id', 'created_at', 'state']

  def self.ransackable_attributes auth_object = nil
    (column_names - UNRANSACKABLE_ATTRIBUTES) + _ransackers.keys
  end

  def self.task_to_published
    # Каждый день в 00.00 меняет статус на published
    ads = self.where("state = ?", 'approved')
    ads.each do |ad|
      ad.publish
    end
  end

  def self.task_to_move_archive
    # Каждый день в 23.50 меняет статус на архивный
    ads = self.where("state = ? and updated_at < ?", 'published', (Date.today - 3.days))
    ads.each do |ad|
      dat_end = ad.updated_at + 3.days
      if dat_end < Date.today
        ad.end
      end
    end
  end


  state_machine :initial => :draft do # Задание изначального состояния
    state :approve, :human_name => 'Added'

    event :send_manager do # Задание события
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
