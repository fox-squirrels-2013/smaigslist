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
  erb :create_event
end

post '/events/create' do
  @event = Event.new(params[:event])
  if @event.save # is this checking is it can save? similar to rescue?
    redirect '/events'
  else
    flash[:error] = @event.errors.values.join("<br>")
    redirect '/events/new'
  end

end


 # => #<ActiveModel::Errors:0x007f8ff4859e28 @base=#<Event id: nil, organizer_name: nil, organizer_email: nil, title: nil, date: nil>, @messages={:date=>["Date cannot be blank, Event not saved"], :title=>["Title cannot be blank, Event not saved"], :organizer_name=>["Organizer Name cannot be blank, Event not saved"], :organizer_email=>["Invalid Email"]}>

# event.errors.messages.values

#### DO NOT PUT ANYTHING BELOW THIS LINE ####

get '/*' do
  redirect '/events'
end
