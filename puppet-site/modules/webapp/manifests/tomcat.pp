define webapp::tomcat (
    $appid                   = 'example-app',
    $baseport                = 8080,
    $ensure                  = 'present',
    $instanceid              = $title,
    $javahome                = '/etc/alternatives/java',
    $manage                  = true,
    $tomcat_instance_basedir = '/opt/apps/tomcat',
    $user                    = 'tomcat',
    $setenv                  = ['JAVA_XMX="128M"'],

  ){
    $port = $baseport
    $serverport = $baseport+1
    $ajpport = $baseport+2
    $app = "${appid}-${instanceid}"

    tomcat::connector { "http-${port}-${appid}":
      ensure   => present,
      owner    => $user,
      group    => $user,
      instance => $app,
      protocol => 'org.apache.coyote.http11.Http11NioProtocol',
      port     => "${port}",
      manage   => true,
      options  => ['compression="on"', 'compressionMinSize="2048"',
      'compressableMimeType="text/html,text/xml,text/plain,application/json,application/xml"',
      'MaxThreads="250"'],
    }
    
    class { '::tomcat':
        sources          => true,
        version          => 7,
        instance_basedir => $tomcat_instance_basedir,
    } ->
    tomcat::instance { $app:
      ensure           => $ensure,
      owner            => $user,
      connector        => [$appid],
      server_port      => "${serverport}",
      ajp_port         => "${ajpport}",
      setenv           => $setenv,
      instance_basedir => $tomcat_instance_basedir,
      java_home        => $javahome,
      manage           => $manage,
    } ->
    file { "${tomcat_instance_basedir}/${app}/webapps/ROOT.war":
      ensure => link,
      target => "/opt/apps/web/${appid}.war",
    }

    $monitname = "tomcat-${app}"
    $pidfile = "${tomcat_instance_basedir}/${app}/temp/tmocat.pid"
    monit::monitor { $monitname:
      pidfile => $pidfile,
      ip_port => $port,
      uid     => 'tomcat',
      gid     => 'tomcat',
      checks  => ["if failed port ${port} protocol HTTP request \"/\" then restart"],
    }
}
