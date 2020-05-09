* google sign-in

  https://developers.google.com/android/guides/client-auth

  > keytool -exportcert  -v -alias ieatta -keystore ~/.android/ieatta.keystore

* Generate Release/Debug Keystores
  file: ieatta.keystore
  note:
       password: ieatta
       key: 
           Alias: keyieatta
           password: kieatta

* android studio's signingReport:
    https://medium.com/pen-bold-kiln-press/sha-1-android-studio-ec02fb893e72

> Task :app:signingReport
Variant: release
Config: release
Store: /Users/djzhang/Documents/Organizations/__flutter/@provider/create_flutter_provider_app/android/app/ieatta.keystore
Alias: keyieatta
MD5: 90:4F:05:C9:9D:01:F4:14:53:F5:E2:CC:E4:80:43:5E
SHA1: 4C:71:CF:F1:2D:D2:3B:4C:2A:3F:99:5C:04:0A:3E:24:3A:FE:5B:A4
SHA-256: 07:B7:6F:4F:64:7A:D0:30:40:43:FC:F3:DA:59:B6:65:A7:BD:66:5C:C8:48:73:19:A3:9D:71:75:71:D6:20:66
Valid until: Wednesday, May 3, 2045       




      