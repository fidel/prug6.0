!SLIDE 
# Redis with Resque #

!SLIDE bullets incremental

# Redis #

* open source
* advanced in-memory key-value store
* often referred to as a data structure server
* since keys can contain strings, hashes, lists, sets and sorted sets

!SLIDE

Redis users
===========

![wtf use redis?!](use_redis.png)
![instagram](instagram.png)


!SLIDE commandline

Installation
============

Homebrew
    $ brew install redis
    $ redis-server /usr/local/etc/redis.conf

Via Resque
    $ git clone git://github.com/defunkt/resque.git
    $ cd resque
    $ rake redis:install dtach:install
    $ rake redis:start

Y U NO HAVE ADMIN ACCESS?!
    $ git clone git://github.com/defunkt/resque.git
    $ cd resque
    $ PREFIX=<your_prefix> rake redis:install dtach:install
    $ rake redis:start

