require 'rails_helper'

RSpec.describe DocsController, type: :controller do
  describe "GET #index" do
    it "show @docs" do
      get :index
      expect(assigns(:docs)).to eq Document.all
    end
  end
  describe "GET #show" do
    it "show @content" do
      get :show, params: { id: 'charter' }
      doc      = Document.new('charter')
      expected = Kramdown::Document.new(doc.content, input: 'GFM').to_html
      expect(assigns(:content)).to eq expected
    end
  end
end
