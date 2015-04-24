class loadbalance::backend {
    $real_instance = hiera_hash(loadbalance::backend::instance)
    create_resources(loadbalance::backend_instance, $real_instance)
}
