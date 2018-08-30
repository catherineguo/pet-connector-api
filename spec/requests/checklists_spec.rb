# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Checklists API' do
  def checklist_params
    {
      title: 'Foofoo July Checklist',
      start_date: '2018-07-01',
      end_date: '2018-07-07',
      pet_name: 'Foofoo',
      instructions: 'Feed Foofoo twice daily.',
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
  #
  # describe 'GET /articles/:id' do
  #   it 'shows one article' do
  #     # make a get request to articles with the id of the article
  #     # we creted befroe running this test
  #     get "/articles/#{article.id}"
  #
  #     expect(response).to be_success
  #
  #     article_response = JSON.parse(response.body)
  #
  #     expect(article_response['id']).not_to be_nil
  #     expect(article_response['title']).to eq(article_params[:title])
  #   end
  # end
  #
  # describe 'DELETE /articles/:id' do
  #   it 'deletes an article' do
  #     delete "/articles/#{article.id}"
  #
  #     expect(response).to be_success
  #     expect(response.body).to be_empty
  #     expect(article).to be_nil
  #   end
  # end
  #
  # describe 'PATCH /articles/:id' do
  #   def article_diff
  #     { title: 'Two Stupid Tricks' }
  #   end
  #
  #   it 'updates an article' do
  #     patch "/articles/#{article.id}", params: { article: article_diff }
  #     expect(response).to be_success
  #     expect(response.body).not_to be_nil
  #     expect(article[:title]).to eq(article_diff[:title])
  #   end
  # end
  #
  # describe 'POST /articles' do
  #   def new_article
  #     {
  #       title: 'Rachel is sick',
  #       content: 'Kids are the problem.'
  #     }
  #   end
  #   it 'creates an article' do
  #     post '/articles/', params: { article: new_article }
  #
  #     expect(response).to be_success
  #
  #     article_response = JSON.parse(response.body)
  #     expect(article_response['id']).not_to be_nil
  #     expect(article_response['title']).to eq(new_article[:title])
  #   end
  # end
end