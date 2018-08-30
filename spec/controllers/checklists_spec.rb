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
      # that we can manipulate. Assigns that object to checklist_collection.
      checklist_collection = JSON.parse(response.body)

      expect(checklist_collection).not_to be_nil
      expect(checklist_collection.first['title']).to eq(checklist['title'])
    end
  end

  describe 'GET show' do
    before(:each) { get :show, params: { id: checklist.id } }
    it 'is successful' do
      expect(response.status).to eq(200)
    end

    it 'renders a JSON response' do
      checklist_response = JSON.parse(response.body)
      expect(checklist_response).not_to be_nil
    end
  end

  describe 'DELETE destroy' do
    it 'is successful' do
      delete :destroy, params: { id: checklist.id }
      expect(response).to be_successful
      expect(response.body).to be_empty
      expect(checklist).to be_nil
    end
  end
end
