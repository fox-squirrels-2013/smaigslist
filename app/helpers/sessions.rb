helpers do
  def save_form_info(params)
    session[:saved_info] = {}
    session[:saved_info][:title]           = params[:title]
    session[:saved_info][:organizer_name]  = params[:organizer_name]
    session[:saved_info][:organizer_email] = params[:organizer_email]
    session[:saved_info][:date]            = params[:date]
  end


  def track(level, id = nil)
    case level
    when :clear
      flash[:breadcrumbs] = ''
    when :category
      c = Category.find(id)
      flash[:breadcrumbs] = "<a href='/categories/<%= c.id %>'>#{c.name}</a>"
    when :post
      p = Post.find(id)
      flash[:breadcrumbs] = "#{p.category.name} >> #{p.title}"
    end
  end
end
