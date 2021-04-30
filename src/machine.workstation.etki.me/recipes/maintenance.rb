package_bundle 'maintenance' do
  packages %w[sensors htop iotop smartmontools]
  overrides(
    'manjaro' => {
      'sensors' => 'lm_sensors'
    }
  )
end
