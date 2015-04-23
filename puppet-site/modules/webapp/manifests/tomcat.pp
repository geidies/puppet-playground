define webapp::tomcat (
    $appid                   = 'example-app',
    $baseport                = 8080,
    $ensure                  = 'present',
    $instanceid              = $title,
    $javahome                = '/etc/alternatives/java',
    $manage                  = true,
    $tomcat_instance_basedir = '/opt/apps/tomcat',
    $user                    = 'tomcat',

  ){
    class { '::tomcat':
        sources          => true,
        version          => 7,
        instance_basedir => $tomcat_instance_basedir,
    }

    $setenv_real = []
    $port = $baseport
    $serverport = $baseport+1
    $ajpport = $baseport+2

    tomcat::connector { "http-${port}-${appid}":
      ensure   => present,
      owner    => $user,
      group    => $user,
      instance => "$appid-$instanceid",
      protocol => 'org.apache.coyote.http11.Http11NioProtocol',
      port     => "${port}",
      manage   => true,
      options  => ['compression="on"', 'compressionMinSize="2048"',
      'compressableMimeType="text/html,text/xml,text/plain,application/json,application/xml"',
      'MaxThreads="250"'],
    }

    tomcat::instance { "$appid-$instanceid":
      ensure           => $ensure,
      owner            => $user,
      connector        => [$appid],
      server_port      => "${serverport}",
      ajp_port         => "${ajpport}",
      setenv           => $setenv_real,
      instance_basedir => $tomcat_instance_basedir,
      java_home        => $javahome,
      manage           => $manage,
    }
}
