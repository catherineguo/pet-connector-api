# frozen_string_literal: true

class ChecklistSerializer < ActiveModel::Serializer
  attributes :id, :title, :start_date, :end_date, :pet_name, :instructions, :editable

  belongs_to :user
  def editable
    scope == object.user
  end
end
