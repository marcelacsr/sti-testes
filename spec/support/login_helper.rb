module LoginHelper
  def login(user  = nil)
    allow_any_instance_of(ApplicationController).
        to receive(:current_user).and_return(logged_user(user))

    allow_any_instance_of(ApplicationController).
        to receive(:logged_in_user?).and_return(true)
  end

  def logged_user(user = nil)
    logged_user = user


    # logged_user ||= double('Sessao')
    #
    # allow(logged_user).to receive(:iduff).and_return('12345678912')
    # allow(logged_user).to receive(:ip).and_return('127.0.0.1')
    logged_user
  end
end

