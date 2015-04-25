class basic::nfsexport($instance) {
  include nfs::server
  $real_instance = hiera_hash(basic::nfsexport::instance)
  create_resources(nfs::server::export, $real_instance)
}
