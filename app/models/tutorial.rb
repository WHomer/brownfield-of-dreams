# frozen_string_literal: true

# Tutorial Model
class Tutorial < ApplicationRecord
  has_many :videos, -> { order(position: :ASC) }
  acts_as_taggable_on :tags, :tag_list
  accepts_nested_attributes_for :videos

  validates_presence_of :title
  validates_presence_of :description

  scope :visitor_content, -> { where(classroom: false) }

  def classroom_content?
    classroom == true
  end
end
