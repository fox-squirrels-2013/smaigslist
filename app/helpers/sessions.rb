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
    when :clear then insert = "<a href='/categories'>all</a>"
    when :category
      c = Category.find(id)
      insert = "<a href='/categories'>all</a>" + "&nbsp; >> &nbsp;" +
               "<a href='/categories/#{c.id}'>#{c.name}</a>"
    when :post
      p = Post.find(id)
      c = p.category
      insert = "<a href='/categories'>all</a>" + "&nbsp; >> &nbsp;" +
               "<a href='/categories/#{c.id}'>#{c.name}</a>" +
               "&nbsp; >> &nbsp;" +  "<a href='/posts/#{p.id}'>#{p.title}</a>"
    end
    session[:breadcrumbs] = insert
  end
end
