class Publication < ActiveRecord::Base
  attr_accessible :title, :genre, :name, :pages, :resume, :notes
  belongs_to :user

  validates :title, presence: true, length: { maximum: 140 }
  validates :genre, presence: true, :inclusion => {:in => [0,1]}
  validates :name, presence: true, length: { maximum: 140 }
  validates :pages, presence: true
  validates_numericality_of :pages, :greater_than_or_equal_to => 1
  validates :user_id, presence: true

  default_scope order: 'publications.created_at DESC'
end
