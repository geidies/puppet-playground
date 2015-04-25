class deployer::war ($instance) {
  $real_instance = hiera_hash(deployer::war::instance)
  create_resources(deployer::war_instance, $real_instance)
}
