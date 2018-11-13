# frozen_string_literal: true

class HomePageController < ApplicationController
  before_action :require_login

  def index; end
end
