# Continuous Delivery - drone.io

### Set-up
See [installation guide](http://readme.drone.io/admin/installation-guide/).

1. Obtain an oauth2 client and secret from Github and expose as environment variable. `DRONE_SECRET` can be a random string
2. `docker-compose up` to start drone
3. You can now access drone on `http://localhost:8080` or on whatever port you've defined in the `docker-compose.yml`
4. Install [CLI](http://readme.drone.io/usage/getting-started-cli/), don't forget to set the environment variables `DRONE_SREVER` and `DRONE_TOKEN` (can be retrieved via web interface). Execute `drone info` to see if everything is set up correctly.

### General Notes
* One **cannot** trigger builds manually, only via webhooks. If you do not want to deploy drone.io to a public server, you can use [ngrok](https://ngrok.com/). But this is quite tedious, so we deploy drone to AWS. We used Ubuntu Xenial and the latest stable version of Docker.
* Add new orphan branch for brakeman output, so that the brakeman output does not trigger a new build.
* The .drone.yml can be updated just via pushing it to the repo.
* Secrets can be stored in the [secret store](http://readme.drone.io/usage/secret-guide/). **Attention**: Secrets are broken in v0.6. However, they work in v0.5. However, in v0.5 there is no web interface for them, so the CLI has to be used. Don't forget to *sign* them!
* drone.io by itself does not offer any caching mechanism. Instead, one would have to use community-provided plugins, such as  *s3* or *rsync*.

### Comparison to Concourse
#### Advantages:
* Generally, the configuration file `.drone.yml` is easier to setup and more concise than Concourse's `pipeline.yml`. For example, you don't have to declare resources explicitely.

#### Disadvantages:
* While Concourse's community is rather small in comparison to Jenkins, drone.io's community is even smaller. There are only a handful of Stackoverflow questions and Github issues, most of them already outdated.
* The documentation is rather poor. Many steps are only explained in a few sentences in the [Getting Started document](http://readme.drone.io/usage/getting-started/). As of 2017-04-26, there are [no tutorials](http://readme.drone.io/tutorials/) and [many](http://readme.drone.io/cli/drone-build-start/) [documentation](http://readme.drone.io/cli/drone-deploy/) [pages](http://readme.drone.io/cli/drone-build-list/) that are empty.
* There are bugs, which are especially painful because of the small community. For example, as mentioned above, secrets don't work in version 0.6, only in 0.5.
* The only way to trigger builds is via web-hooks. It would be nice if one could force a build manually, especially when running drone.io locally.
* While drone.io's web interface looks nice and makes good use of the space, it's missing Concourse's overview which job is currently running, which job failed etc. However, [they (or rather *the* developer) are working on it](https://github.com/drone/drone/issues/1857).