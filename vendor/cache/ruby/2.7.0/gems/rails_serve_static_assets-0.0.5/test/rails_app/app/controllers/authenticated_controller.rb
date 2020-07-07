class AuthenticatedController < ApplicationController
  if respond_to?(:before_action)
    class << self
      alias :before_action :before_action
    end
  end

  before_action :authenticate_user!

  def index
  end
end
