require 'sinatra/base'

class Images < Sinatra::Base

	get '/*.*' do |path, ext|
		path = "#{path}.#{ext}"
		master = "master/#{path}"
		cache = "cache/#{path}"
		halt 404 unless File.exists?(master)
		image = Magick::Image::read(master).first
		image.resize!(params[:w].to_i, params[:h].to_i)
		image.write(cache)
		send_file cache
	end

end
