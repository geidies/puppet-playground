class deployer::zip ($instance) {
  $real_instance = hiera_hash(deployer::zip::instance)
  create_resources(deployer::zip_instance, $real_instance)
}
