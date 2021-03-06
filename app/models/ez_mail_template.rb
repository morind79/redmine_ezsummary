class EzMailTemplate < ActiveRecord::Base
  belongs_to :users

  validates_presence_of :content
  validates_uniqueness_of :content, :scope => :user_id
  validates_presence_of :user_id
end