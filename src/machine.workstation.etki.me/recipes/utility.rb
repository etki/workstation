package_bundle 'utility.network' do
  packages %w[iperf3 net-tools nftables]
  overrides(
    'manjaro' => {
      'net-tools' => 'bind'
    }
  )
end
