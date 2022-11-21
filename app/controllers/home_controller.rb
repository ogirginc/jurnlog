# frozen_string_literal: true

class HomeController < ApplicationController
  skip_before_action :authenticate, only: [:index]

  def index
    @posts = Post.all
  end
end
