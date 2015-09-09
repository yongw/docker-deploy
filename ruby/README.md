Ruby Docker image
================

Build ruby Docker image. This image uses yum to install ruby, currently the available 
ruby version is `2.0.2`. And the correcponding gem version is `1.4.6`.

Build
----

`docker build -t dockerlab.int.thomsonreuters.com:30000/ruby .`

Test
----

`docker run --rm -it -p 80:8001 -v $(pwd)/samples/:/samples/ dockerlab.int.thomsonreuters.com:30000/ruby sh -c /samples/hello_world/run.sh`
