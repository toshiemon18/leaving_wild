require "optparse"

params = {}

opt = OptionParser.new
opt.on('-h num') {|v| params[:h] = v }
opt.on('-m num') {|v| params[:m] = v }
opt.parse!(ARGV)
# p params

loop do
  now = Time.now
  if now.hour.to_i == params[:h].to_i && now.min.to_i == params[:m].to_i then
    mp3_file = "mp3/10\ Get\ Wild.mp3"
    system("afplay  \"#{mp3_file}\"")
    puts "\n Completed"
    exit
  end
end
