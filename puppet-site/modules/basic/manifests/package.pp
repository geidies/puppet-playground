#basic::package
#Intended for basic package installation
class basic::package ($instance){
  $real_instance = hiera_array(basic::package::instance)
  realize Package[$real_instance]
}
