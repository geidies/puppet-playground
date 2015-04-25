class basic::nfsmount($instance) {
  include nfs::client
  $real_instance = hiera_hash(basic::nfsmount::instance)
  create_resources(nfs::client::mount, $real_instance)
}
