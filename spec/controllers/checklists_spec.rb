# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ChecklistsController do
  def checklist_params
    {
      title: 'Foofoo July Checklist',
      start_date: '2018-07-01',
      end_date: '2018-07-07',
      pet_name: 'Foofoo',
      instructions: 'Feed Foofoo twice daily.',
    }
  end

  def checklist
    Checklist.first
  end

  before(:all) do
    Checklist.create!(checklist_params)
  end

  after(:all) do
    Checklist.delete_all
  end

  describe 'GET index' do
    before(:each) { get :index }
    it 'is succesful' do
      expect(response.status).to eq(200) # be_success
    end

    it 'renders a JSON response' do
      # takes the JSON in the response and makes it into a Ruby object
      # that we can manipulate. Assigns that object to article_collection.
      checklists_collection = JSON.parse(response.body)

      expect(checklists_collection).not_to be_nil
      expect(checklists_collection.first['title']).to eq(checklist['title'])
    end
  end
end
