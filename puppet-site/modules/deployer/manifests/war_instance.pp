define deployer::war_instance (
  $application = $name,
  $version = '',
  $basepath = '/opt/apps/web',
  $remoteserver = 'http://'
) {

  deployer::remote_file { "$basepath/$application-$version.war":
    remote_location => "$remoteserver/$application-$version.war",
  } ->
  file { "$basepath/$application.war":
    ensure  => link,
    target  => "$basepath/$application-$version.war",
    force   => true,
    require => File[$basepath],
  }

}
