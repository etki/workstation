package_bundle 'virtualization.service' do
  packages %w[
    virtualbox virtualbox-host-dkms virtualbox-guest-iso
    qemu qemu-arch-extra
    vagrant
  ]
end
