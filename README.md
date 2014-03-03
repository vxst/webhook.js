webhook.js
==========

WebHook server for gitlab

Insert a line in coffee script:

```coffeescript
webHooks['WhatSite']={'key':'WhatKey','script':'./GitFetch.sh'}
```

Then set the gitlab post to
/webhooks/WhatSite/key/WhatKey
./GitFetch.sh will run

A sample of gitfetch can be like that

```shell
#!/bin/bash
cd /root/webroot/
git reset --hard
git pull
```
