require 'rails_helper'

describe MoviesController do
  describe 'Search movies by the same director' do
    it 'should call Movie.samedirector' do
      expect(Movie).to receive(:samedirector).with('Aladdin')
      get :search, { title: 'Aladdin' }
    end

    it 'should assign similar movies if director exists' do
      movies = ['Seven', 'The Social Network']
      Movie.stub(:samedirector).with('Seven').and_return(movies)
      get :search, { title: 'Seven' }
      expect(assigns(:samedirector)).to eql(movies)
    end

    it "should redirect to home page if director isn't known" do
      Movie.stub(:samedirector).with('No name').and_return(nil)
      get :search, { title: 'No name' }
      expect(response).to redirect_to(root_url)
    end
  end
end