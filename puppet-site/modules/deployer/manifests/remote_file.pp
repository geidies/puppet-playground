define deployer::remote_file(
  $remote_location=undef, 
  $mode='0644'
){

  exec { "retrieve_${title}":
    command => "curl -L ${remote_location} -o ${title}",
    creates => $title,
  }

  file { $title:
    mode    => $mode,
    require => Exec["retrieve_${title}"],
  }
}
