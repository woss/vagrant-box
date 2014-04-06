exec { "apt-update":
    command => "/usr/bin/apt-get update"
}

hiera_include('classes')
