class PropertyController < ApplicationController
  def browse
    @postings = Posting.all
  end

  def post
  end

  def details

  end
end
