require_relative '../../app/lib/mongoid_configuration'

Mongoid.configure do |config|
  if Rails.env.test?
    config.clients['cnc_test'] = {
      hosts: ['localhost:27017'],
      database: 'cnc_test',
      options: [
        { write: { w: 1 } },
        { read: { mode: :primary } },
        { max_read_retries: 40 },
        { read_retry_interval: 0.25 },
        { connect_timeout: 10 },
        { max_pool_size: 10 },
        { local_threshold: 60 }
      ]
    }
  end

rescue ActiveRecord::NoDatabaseError, ActiveRecord::StatementInvalid
  puts 'MONGO RESCUER'
end

