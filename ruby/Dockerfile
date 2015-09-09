# Build Ruby image
FROM centos

MAINTAINER Yong Wang <yong.wang@thomsonreuters.com>

ENV http_proxy="http://webproxy.pln.corp.services:80" https_proxy="http://webproxy.pln.corp.services:80"
RUN yum update -y \
    && yum install -y ruby

RUN gem install sinatra

ENV http_proxy="" https_proxy=""

