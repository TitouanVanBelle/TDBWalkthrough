Pod::Spec.new do |s|
  s.name             = "TDBWalkthrough"
  s.version          = "1.0.0"
  s.summary          = "An easy way to add a walkthrough at launch"
  s.description      = <<-DESC
                       TDBWalkthrough is a pod that allows you to add a walkthrough when the app starts.
                       DESC
  s.homepage         = "https://github.com/TitouanVanBelle/TDBWalkthrough"
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { "Titouan Van Belle" => "titouan.vanbelle@gmail.com" }
  s.source           = { :git => "https://github.com/TitouanVanBelle/TDBWalkthrough.git", :tag => "1.0.0" }

  s.source_files = 'Classes/*.{h,m}'
  s.resources = ["images/*.png", "classes/MyView.xib"]

  s.platform = :ios, '7.0'
  s.ios.deployment_target = '7.0'
  s.requires_arc = true

  s.subspec 'Interfaces' do |ss|
    ss.source_files = 'Interfaces/*.{h,m,xib}'
    ss.resources = 'Interfaces/*.{xib}'
  end
  
end
