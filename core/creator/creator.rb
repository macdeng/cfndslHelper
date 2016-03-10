require_relative './resource/create_elb'
require_relative './resource/create_ec2'
require_relative './resource/create_eip'
require_relative './resource/create_volume'
require_relative './resource/create_volume_attachment'
require_relative './resource/create_sg'
require_relative './resource/create_sg_ingress'


# Dir.glob(File.expand_path('./resource/create_*', __FILE__)).each do |file|
#   require_relative file
# end