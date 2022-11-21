# frozen_string_literal: true

class UserController < ApplicationController
  def show
    @posts = Post.all
  end
end
