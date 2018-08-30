# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'routes for checklists' do
  it 'routes GET /checklists to the checklists#index action' do
    expect(get('/checklists')).to route_to('checklists#index')
  end
end
