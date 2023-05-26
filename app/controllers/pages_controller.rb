class PagesController < ApplicationController
  def home
    @prompts = Prompt.all.order(created_at: :asc)

  end
end
