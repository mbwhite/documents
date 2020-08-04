

```
#!/bin/bash

export MICROFAB_CONFIG='{
    "endorsing_organizations":[
        {
            "name": "MagnetoCorp"
        }
    ],
    "channels":[
        {
            "name": "heronet",
            "endorsing_organizations":[
                "MagnetoCorp"
            ]
        }
    ]
}'

docker run --rm -ti -p 8080:8080 -e MICROFAB_CONFIG="${MICROFAB_CONFIG}" --name microfab microfab
```