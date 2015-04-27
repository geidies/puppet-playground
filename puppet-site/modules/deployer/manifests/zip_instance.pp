define deployer::zip_instance (
  $target = $name,
  $remoteserver,
  $artefact,
) {

  deployer::remote_file { "/tmp/$artefact":
    remote_location => "$remoteserver/$artefact",
  } ->
  exec { "unzip $artefact":
    command => "unzip -o /tmp/$artefact -d $target",
    creates => "${target}/images/logo.png"
  }

}
