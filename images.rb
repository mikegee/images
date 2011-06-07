require 'sinatra/base'

class Images < Sinatra::Base

	get '/*.*' do
		filename = 'master/' + params[:splat].join('.')
		halt 404 unless File.exists?(filename)
		send_file filename
	end

end
