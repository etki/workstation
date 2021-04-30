package_bundle 'containerization.service' do
  packages %w[lxc lxd containerd runc docker-ce podman]
  overrides(
    'manjaro' => {
      'docker-ce' => 'docker'
    }
  )
end

package_bundle 'containerization.utility' do
  packages %w[buildah skopeo skaffold]
end
