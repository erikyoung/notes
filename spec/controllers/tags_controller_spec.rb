require 'rails_helper'

RSpec.describe TagsController, type: :controller do
	describe "tags#create action" do
		it "should return 200 status-code" do
			note = FactoryGirl.create(:note)
			post :create, params: { tag: { name: 'Crazy'}, note_id: note.id }
			expect(response).to be_success
		end

		it "should successfully create and save a new tag in our database" do
			note = FactoryGirl.create(:note)
			post :create, params: { tag: { name: 'Crazy'}, note_id: note.id }
			expect(note.tags.first.name).to eq('Crazy')
		end
	end

end
