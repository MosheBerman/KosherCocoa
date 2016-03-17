Pod::Spec.new do |s|

  s.name         = "KosherCocoa"
  s.version      = "3.0.5"
  s.summary      = "KosherCocoa is a Zmanim and Chagim Library for iOS."
  s.description  = <<-DESC
  KosherCocoa is a Zmanim and Chagim library for iOS.
                   DESC
  s.homepage     = "http://github.com/MosheBerman/KosherCocoa"
  s.license      = "LGPL 2.1"
  s.author             = { "Moshe Berman" => "moshberm@gmail.com" }
  s.social_media_url   = "http://twitter.com/bermaniastudios"
  s.ios.deployment_target = "8.0"
  s.watchos.deployment_target = "2.0"
  s.source       = { :git => "https://github.com/MosheBerman/KosherCocoa.git", :tag => s.version.to_s }
  s.source_files  = "KosherCocoa**/*.{h,m,c}", "KosherCocoa**/**/*.{h,m,c}"
  s.requires_arc = true
end
