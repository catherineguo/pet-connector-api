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

  it 'routes DELETE /checklists/:id to the checklists#destroy action' do
    expect(delete('/checklists/1')).to route_to(
      controller: 'checklists',
      action: 'destroy',
      id: '1'
    )
  end

  it 'routes PATCH /checklists/:id to the checklists#update action' do
    expect(patch('/checklists/1')).to route_to(
      controller: 'checklists',
      action: 'update',
      id: '1'
    )
  end

  it 'routes POST /checklists to the checklists#create action' do
    expect(post('/checklists')).to route_to('checklists#create')
  end
end
