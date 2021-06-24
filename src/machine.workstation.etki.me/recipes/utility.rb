package_bundle 'utility.network' do
  packages %w[iperf3 net-tools nftables progress]
  overrides(
    'manjaro' => {
      'net-tools' => 'bind'
    }
  )
end
