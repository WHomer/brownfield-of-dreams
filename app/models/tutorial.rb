# frozen_string_literal: true

class Tutorial < ApplicationRecord
  has_many :videos, -> { order(position: :ASC) }
  acts_as_taggable_on :tags, :tag_list
  accepts_nested_attributes_for :videos

  scope :visitor_content, -> { where(classroom: false) }

  def classroom_content?
    classroom == true
  end
end
