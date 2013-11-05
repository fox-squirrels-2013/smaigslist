helpers do

  def save_form_info(params)
    session[:saved_info] = {}
    session[:saved_info][:title]           = params[:title]
    session[:saved_info][:organizer_name]  = params[:organizer_name]
    session[:saved_info][:organizer_email] = params[:organizer_email]
    session[:saved_info][:date]            = params[:date]
  end


end

