module App
  module Repositories
    class UserRepository
      def find_by_id(id)
        DB[:users].find(id: id).first
      end

      def all
        DB[:users].all
      end

      def create(user)
        DB[:users] << user
      end
    end

  end
end
