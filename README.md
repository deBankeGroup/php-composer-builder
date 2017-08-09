# Installing Extensions

See here for installing more extensions <https://github.com/docker-library/docs/tree/master/php#how-to-install-more-php-extensions>

# Label Schema

<http://label-schema.org/rc1/>

## Extracting LABEL metadata with JQ

docker inspect ${my_container} | jq -r '.[0].Config.Labels["org.label-schema.maintainer"]'

# Building

```sh
docker build --build-arg date=$(date +%Y-%m-%dT%T%z) -t foo
```
