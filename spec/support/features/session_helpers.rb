module Features

  module SessionHelpers
    include Warden::Test::Helpers

    def sign_in(user)
      login_as(user, scope: :user)
    end
  end

end