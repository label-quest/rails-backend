require 'rails_helper'

RSpec.describe "DatasetClasses", type: :request do
  describe "GET /dataset_classes" do
    it "works! (now write some real specs)" do
      get dataset_classes_path
      expect(response).to have_http_status(200)
    end
  end
end
