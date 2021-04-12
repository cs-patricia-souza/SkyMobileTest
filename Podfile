platform :ios, '11.0'
use_frameworks!

def main_pods
  pod 'Kingfisher', '~> 5.0'
end

def test_pods
  pod 'Quick', '~> 1.3.2'
  pod 'Nimble', '~> 7.3.2'
  pod 'Nimble-Snapshots', '6.9.0'
end

def mock_and_stub
  pod 'Cuckoo', '0.12.0'
  pod 'OHHTTPStubs/Swift', '6.1.0'
end

target 'SkyMobileTest' do
  inherit! :search_paths
  main_pods
  
  target 'SkyMobileTestTests' do
    inherit! :search_paths
    main_pods
    test_pods
    mock_and_stub
  end

  target 'SkyMobileTestUITests' do
    inherit! :search_paths
    mock_and_stub
  end
end
