#basic::directory
#Intended for basic parent dir creation
class basic::directory ($instance){
  $real_instance = hiera_hash(basic::directory::instance)
  $defaults = {
    'ensure' => 'directory',
    'mode'   => '0755',
    'owner'  => 'root',
    'group'  => 'root',
  }
  create_resources(file, $real_instance, $defaults)
}
