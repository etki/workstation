# generally those are just drivers so it should be safe to install them
# on every machine
package_bundle 'drivers' do
  packages %w[broadcom-wl-dkms]
end
