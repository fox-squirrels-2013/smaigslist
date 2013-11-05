enable :sessions
use Rack::Flash


get '/events' do
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new' do
  ### need to get session or params info here
  erb :create_event
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

get '/*' do
  redirect '/events'
end
