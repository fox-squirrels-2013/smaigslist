enable :sessions
use Rack::Flash




get '/categories' do
  @categories = Category.all
  track(:clear)

  erb :index
end

get '/categories/:id' do
  @category = Category.find(params[:id])
  @posts = @category.posts
  session[:category_id] = @category.id
  track(:category, @category.id)
  erb :cat_posts
end


get '/posts/:id' do
  @post = Post.find(params[:id])
  track(:post, @post.id)
  erb :post
end


get '/post/new' do
  @category = Category.find(session[:category_id]).name
  erb :new_post
end

post '/posts/new' do
  p = Post.create! params[:post]
  redirect "posts/#{p.id}"
end

post '/events/new' do
  @event = Event.new(params[:event])
  if @event.save
    session.clear
    redirect '/events'
  else
    flash[:title]           = @event.errors[:title].first
    flash[:organizer_name]  = @event.errors[:organizer_name].first
    flash[:organizer_email] = @event.errors[:organizer_email].first
    flash[:date]            = @event.errors[:date].first
    save_form_info(params[:event])
    redirect '/events/new'
  end
end

# get '/*' do
#   redirect '/categories'
# end
