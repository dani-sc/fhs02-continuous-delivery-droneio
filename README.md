# fhs02-continuous-delivery-droneio

## Installation

See [installation guide](http://readme.drone.io/admin/installation-guide/).

1. Obtain an oauth2 client and secret from Github and expose as environment variable. `DRONE_SECRET` can be a random string
2. `docker-compose up` to start drone
3. You can now access drone on http://localhost:8080 or on whatever port you've defined in the `docker-compose.yml`
4. Install [CLI](http://readme.drone.io/usage/getting-started-cli/), don't forget to set env. variables `DRONE_SREVER` and `DRONE_TOKEN` (can be retrieved via web interface). Execute `drone info` to see if everything is set up correctly.
5. One **cannot** trigger builds manually, only via webhooks. If you do not want to deploy drone.io to a public server, you can use [ngrok](https://ngrok.com/)