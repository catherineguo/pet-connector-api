# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Checklists API' do
  def checklist_params
    {
      title: 'Foofoo July Checklist',
      start_date: '2018-07-01',
      end_date: '2018-07-07',
      pet_name: 'Foofoo',
      instructions: 'Feed Foofoo twice daily.'
    }
  end

  def checklists
    # returns a list of all checklists
    Checklist.all
  end

  def checklist
    # returns the first checklist
    Checklist.first
  end

  before(:all) do
    # before each test, create checklist using the
    # checklist params (above)
    Checklist.create!(checklist_params)
  end

  after(:all) do
    # deletes the checklist after all tests have run
    Checklist.delete_all
  end

  # feature test
  # we're describing what happens when a get request is made to
  # /checklists
  describe 'GET /checklists' do
    # we expect the get request to return a list of all the checklists
    it 'lists all checklists' do
      # get is a function that takes a string, and makes a get
      # request to that address
      get '/checklists'
      # Expect to get a 20x response (success)
      expect(response).to be_success

      # sets the variable checklists_response to the body of the
      # http response
      checklists_response = JSON.parse(response.body)
      # expect the list of checklists that we get from the server to be
      # the same length as the list of checklists we created
      expect(checklists_response.length).to eq(checklists.count)
      # check that the first checklist's title is equal to the checklist title
      # that we created
      expect(checklists_response.first['title']).to eq(checklist['title'])
    end
  end

  describe 'GET /checklists/:id' do
    it 'shows one checklist' do
      # make a get request to checklists with the id of the checklist
      # we created before running this test
      get "/checklists/#{checklist.id}"

      expect(response).to be_success

      checklist_response = JSON.parse(response.body)

      expect(checklist_response['id']).not_to be_nil
      expect(checklist_response['title']).to eq(checklist_params[:title])
    end
  end

  describe 'DELETE /checklists/:id' do
    it 'deletes a checklist' do
      delete "/checklists/#{checklist.id}"

      expect(response).to be_success
      expect(response.body).to be_empty
      expect(checklist).to be_nil
    end
  end

  describe 'PATCH /checklists/:id' do
    def checklist_diff
      { title: 'Foofoo July 1 to July 7 Checklist' }
    end

    it 'updates a checklist' do
      patch "/checklists/#{checklist.id}", params: { checklist: checklist_diff }
      expect(response).to be_success
      expect(response.body).not_to be_nil
      expect(checklist[:title]).to eq(checklist_diff[:title])
    end
  end

  describe 'POST /checklists' do
    def new_checklist
      {
        title: 'Barbar August Checklist',
        start_date: '2018-08-01',
        end_date: '2018-08-08',
        pet_name: 'Barbar',
        instructions: 'Feed Barbar once everyday.'
      }
    end

    it 'creates a checklist' do
      post '/checklists/', params: { checklist: new_checklist }

      expect(response).to be_success

      checklist_response = JSON.parse(response.body)
      expect(checklist_response['id']).not_to be_nil
      expect(checklist_response['title']).to eq(new_article[:title])
    end
  end
end
