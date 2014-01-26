exec { "apt-update":
    command => "/usr/bin/apt-get update"
}
hiera_include('classes')
# include toolbox
# class { 'python':
#   version    => 'system',
#   dev        => true,
#   virtualenv => false,
#   gunicorn   => true,
#   pip => true,
# }
# python::pip { 'flexget':
#   # owner		=> 'vagrant',
#   ensure	=> "present",
# }
# # python::pip { 'flexget-webui':
# #   # owner		=> 'vagrant',
# #   ensure	=> "present",
# # }