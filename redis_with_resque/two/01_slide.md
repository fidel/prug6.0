!SLIDE bullets incremental

# Resque #

* Redis-backed library
* for creating background jobs
* placing those jobs on multiple queues and processing them later
* Background jobs can be any Ruby class or module that responds to *perform*

!SLIDE bullets incremental

# Resque features #

* Ruby library for creating, querying, and processing jobs
* Rake task for starting a worker which processes jobs
* Sinatra app for monitoring queues, jobs, and workers

!SLIDE smaller
# Sample worker #

    @@@ Ruby
    class Archive
      @queue = :file_serve

      def self.perform(repo_id, branch = 'master')
        repo = Repository.find(repo_id)
        repo.create_archive(branch)
      end
    end

# Job queueing #

    @@@ Ruby
    class Repository
      def async_create_archive(branch)
        Resque.enqueue(Archive, self.id, branch)
      end
    end

!SLIDE commandline

# Running workers #

single worker for any queue
    $ QUEUE=* rake resque:work

single worker for specific queues
    $ QUEUE=file_serve,archive rake resque:work

priority queues
    $ QUEUE=high,medium,low rake resque:work

background
    $ QUEUE=* BACKGROUND=yes PIDFILE=./tmp/resque_worker.pid \
      rake resque:work
