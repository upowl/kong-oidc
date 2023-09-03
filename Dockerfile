FROM kong:3.3.1-alpine

USER root

RUN apk add --no-cache unzip
RUN apk add --no-cache gcc
RUN apk add --no-cache g++

ENV LUA_PATH /usr/local/share/lua/5.1/?.lua;/usr/local/kong-oidc/?.lua;;
# For lua-cjson
ENV LUA_CPATH /usr/local/lib/lua/5.1/?.so;;

RUN luarocks install luacov
RUN luarocks install luaunit
RUN luarocks install lua-cjson

RUN luarocks install lua-resty-openidc 1.6.0

USER kong

COPY . /usr/local/kong-oidc
