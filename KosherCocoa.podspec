Pod::Spec.new do |s|

  s.name         = "KosherCocoa"
  s.version      = "3.6.0"
  s.summary      = "KosherCocoa is a Hebrew Calendar, Jewish Prayer, and Jewish Holiday Library for iOS, tvOS, and watchOS."
  s.description  = <<-DESC
  KosherCocoa is a Hebrew Calendar, Jewish Prayer, and Jewish Holiday Library for iOS, tvOS, and watchOS. The code works on macOS too, but not as a pod at this time.
                   DESC
  s.homepage     = "http://github.com/MosheBerman/KosherCocoa"
  s.license      = "LGPL 2.1"
  s.author             = { "Moshe Berman" => "moshberm@gmail.com" }
  s.social_media_url   = "http://twitter.com/bermaniastudios"
  s.ios.deployment_target = "8.0"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"
  s.source       = { :git => "https://github.com/MosheBerman/KosherCocoa.git", :tag => s.version.to_s }
  s.source_files  = "KosherCocoa**/*.{h,m,c}", "KosherCocoa**/**/*.{h,m,c}"
  s.requires_arc = true
end
