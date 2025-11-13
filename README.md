# nebulum.cr
Web-API for [rovers.nebulum.one](https://rovers.nebulum.one/) access real-time Mars rover photos from NASA missions

## Example
```cr
require "./nebulum"

nebulum = Nebulum.new
photo_info = nebulum.get_photo_by_id(photo_id=1)
puts photo_info
```
