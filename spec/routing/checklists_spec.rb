# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'routes for checklists' do
  it 'routes GET /checklists to the checklists#index action' do
    expect(get('/checklists')).to route_to('checklists#index')
  end

  it 'routes GET /checklists/:id to the checklists#show action' do
    expect(get('checklists/1')).to route_to(
      controller: 'checklists',
      action: 'show',
      id: '1'
    )
  end
end
