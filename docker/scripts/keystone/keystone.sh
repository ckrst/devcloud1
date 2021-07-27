docker exec openstack_keystone su -s /bin/sh -c "keystone-manage db_sync" keystone

docker exec openstack_keystone keystone-manage fernet_setup --keystone-user keystone --keystone-group keystone
docker exec openstack_keystone keystone-manage credential_setup --keystone-user keystone --keystone-group keystone

docker exec openstack_keystone keystone-manage bootstrap --bootstrap-password ADMIN_PASS \
  --bootstrap-admin-url http://controller:5000/v3/ \
  --bootstrap-internal-url http://controller:5000/v3/ \
  --bootstrap-public-url http://controller:5000/v3/ \
  --bootstrap-region-id RegionOne
