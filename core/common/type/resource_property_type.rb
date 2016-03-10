module GluCfn
  module ResourcePropertyType
    module Listener
      Instance_Port = 'InstancePort'
      Instance_Protocol = 'InstanceProtocol'
      Load_Balancer_Port = 'LoadBalancerPort'
      Protocol = 'Protocol'
      SSL_Certificate_Id = 'SSLCertificateId'
      Policy_Names = 'PolicyNames'
    end
    module LBOrAppCookieStickinessPolicy
      Cookie_Name = 'CookieName'
      Policy_Name = 'PolicyName'
      Cookie_Expiration_Period = 'CookieExpirationPeriod'
    end
    module AppCookieStickinessPolicy
      Cookie_Name = 'CookieName'
      Policy_Name = 'PolicyName'
    end
    module LBCookieStickinessPolicy
      Cookie_Expiration_Period = 'CookieExpirationPeriod'
      Policy_Name = 'PolicyName'
    end
    module ConnectionDrainingPolicy
      Enabled = 'Enabled'
      Timeout = 'Timeout'
    end
    module ConnectionSettings
      Idle_Timeout = 'IdleTimeout'
    end
    module ElasticLoadBalancingPolicy
      Attributes = 'Attributes'
      Instance_Ports = 'InstancePorts'
      Load_Balancer_Ports = 'LoadBalancerPorts'
      Policy_Name = 'PolicyName'
      Policy_Type = 'PolicyType'
    end
    module HealthCheck
      Healthy_Threshold = 'HealthyThreshold'
      Interval = 'Interval'
      Target = 'Target'
      Timeout = 'Timeout'
      Unhealthy_Threshold = 'UnhealthyThreshold'
    end
  end
end