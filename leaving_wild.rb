require "optparse"

params = {}

opt = OptionParser.new
opt.on('-h num') {|v| params[:h] = v }
opt.on('-m num') {|v| params[:m] = v }
opt.on("-t num") {|v| params[:t] = v }
opt.parse!(ARGV)
# p params

def play_get_wild(play_time)
  mp3_file = "mp3/Get_Wild.mp3"
  t1 = Thread.fork do 
    system("afplay  \"#{mp3_file}\"")
  end

  sleep(play_time.to_i)
  t1.kill
  system("killall afplay")
end

loop do
  now = Time.now
  if now.hour.to_i == params[:h].to_i && now.min.to_i == params[:m].to_i then
    break
  end
end

play_time = 30 if !params[:t]
play_get_wild(play_time)
