RailsAdmin.config do |config|
  ADMIN_EMAILS= ['sergiu.mironescu@gmail.com'] # Add more e-mails if you are working on a team: ['email1', 'email2']
  config.current_user_method { current_user } # auto-generated
  config.authenticate_with {} # leave it to authorize
  config.authorize_with do
    is_admin= ADMIN_EMAILS.include?(current_user.email)
    if current_user.admin?
      rails_admin.dashboard_path
    else
      request.env["HTTP_REFERER"] = '/' # Needs to be added to work with redirect
      redirect_to rails_admin.dashboard_path
    end
  end

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
