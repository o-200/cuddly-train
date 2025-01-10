# frozen_string_literal: true

class UserService
  def initialize(user_repository)
    @user_repository = user_repository
  end

  def find_user(id)
    @user_repository.find_by_id(id)
  end

  def list_users
    @user_repository.all
  end

  def create_user(user_params)
    @user_repository.create(user_params)
  end
end
