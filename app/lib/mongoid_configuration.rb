class MongoidConfiguration
  def self.configure(tenant)
    Mongoid::Config.clients[tenant.app_name] = options(tenant)
  end

  def self.options(tenant)
    {
      hosts: ['localhost:27017'],
      database: "cnc_iam_#{tenant.app_name}",
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
end
