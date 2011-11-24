!SLIDE smbullets incremental

# Choose Resque if

* You need multiple queues
* You don't care / dislike numeric priorities
* You don't need to persist every Ruby object ever
* You have potentially huge queues
* You want to see what's going on
* You expect a lot of failure / chaos
* You can setup Redis
* You're not running short on RAM

!SLIDE smbullets incremental

# Choose DelayedJob if

* You like numeric priorities
* You're not doing a gigantic amount of jobs each day
* Your queue stays small and nimble
* There is not a lot failure / chaos
* You want to easily throw anything on the queue
* You don't want to setup Redis

!SLIDE smaller

# Problems

## `Mysql::Error: MySQL server has gone away`

    @@@ Ruby
    class BaseTask
      def self.perform(*args)
        ActiveRecord::Base.verify_active_connections!
        self.perform_delegate(*args)
      end

      def self.perform_delegate(*args) # overload this
      end
    end

    class SampleWorker < BaseTask
      def self.perform_delegate(id)
        ...
      end
    end

!SLIDE bullets incremental

# Plugins

* [Resque scheduler](https://github.com/bvandenbos/resque-scheduler)
* [Resque mailer](https://github.com/zapnap/resque_mailer)
* [Much more...](https://github.com/defunkt/resque/wiki/plugins)

!SLIDE 

# Questions?
