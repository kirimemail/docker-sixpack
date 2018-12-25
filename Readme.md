# Dockerized Sixpack server, for a/b-testing

The Docker container contains sixpack and sixpack-web server environment.

The Sixpack Dashboard is running at port 8080.
The Sixpack Server is running at port 8000.

## Simple Usage

If you just run sixpack with docker, you can use trusted builds registered [Docker index][di],

    docker pull kirimemail/docker-sixpack

## Deploying

Another example of deploying sixpack is:

    docker run -d -t --name sixpack \
                -p 8000:8000 \
                -p 8080:8080 \
                -e SIXPACK_CONFIG_REDIS_HOST={YOUR_REDIS_HOST} kirimemail/docker-sixpack

## Resources

Sixpack is a language-agnostic a/b-testing framework.

* [Introduction page](http://sixpack.seatgeek.com)
* [Sixpack repo](https://github.com/seatgeek/sixpack)


[fk]: http://help.github.com/forking/
[di]: https://hub.docker.com/r/kirimemail/docker-sixpack/