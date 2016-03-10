# helper functions used for creating resources
require_relative '../../common/type/resource_property_type'

require_relative '../../property_type/listener'
require_relative '../../property_type/lb_or_app_cookie_stickiness_policy'
require_relative '../../property_type/app_cookie_stickiness_policy'
require_relative '../../property_type/lb_cookie_stickiness_policy'
require_relative '../../property_type/connection_draining_policy'
require_relative '../../property_type/connection_settings'
require_relative '../../property_type/elastic_load_balancing_policy'
require_relative '../../property_type/health_check'
require_relative '../../property_type/ec2_tag'

def createListener(listener)
  if(!listener.is_a?(Listener))
    raise('the input parameter should be of Listener type!')
  end
  ret = Hash.new
  if listener.instanceport
    if(!listener.instanceport.is_a?(String))
      raise('the instanceport attribute should be of String type!')
    end
    ret[GluCfn::ResourcePropertyType::Listener::Instance_Port] = listener.instanceport
  end
  if listener.instanceprotocol
    if(!listener.instanceprotocol.is_a?(String))
      raise('the instanceprotocol attribute should be of String type!')
    end
    ret[GluCfn::ResourcePropertyType::Listener::Instance_Protocol] = listener.instanceprotocol
  end
  if listener.loadbalancerport
    if(!listener.loadbalancerport.is_a?(String))
      raise('the loadbalancerport attribute should be of String type!')
    end
    ret[GluCfn::ResourcePropertyType::Listener::Load_Balancer_Port] = listener.loadbalancerport
  end
  if listener.protocol
    if(!listener.protocol.is_a?(String))
      raise('the protocol attribute should be of String type!')
    end
    ret[GluCfn::ResourcePropertyType::Listener::Protocol] = listener.protocol
  end
  if listener.sslcertificateid
    if(!listener.sslcertificateid.is_a?(String))
      raise('the sslcertificateid attribute should be of String type!')
    end
    ret[GluCfn::ResourcePropertyType::Listener::SSL_Certificate_Id] = listener.sslcertificateid
  end
  if listener.policynames
    if(!listener.policynames.is_a?(Array))
      raise('the poclicynames attribute should be of Array type!')
    end
    a_policynames = Array.new
    listener.policynames.each do |policyname|
      if(!policyname.is_a?(LBOrAppCookieStickinessPolicy))
        raise('each policyname should be of LBOrAppCookieStickinessPolicy type!')
      end
      a_policynames.insert(-1,createLBOrAppCookieStickinessPolicy(policyname))
    end
    ret[GluCfn::ResourcePropertyType::Listener::Policy_Names] = a_policynames
  end
  return ret
end

def createLBOrAppCookieStickinessPolicy(policyname)
  if(!policyname.is_a?(LBOrAppCookieStickinessPolicy))
    raise('the input parameter should be of LBOrAppCookieStickinessPolicy type!')
  end
  ret = Hash.new
  if policyname.cookiename
    if(!policyname.cookiename.is_a?(String))
      raise('the cookiename attribute should be of String type!')
    end
    ret[GluCfn::ResourcePropertyType::LBOrAppCookieStickinessPolicy::Cookie_Name] = policyname.cookiename
  end
  if policyname.policyname
    if(!policyname.policyname.is_a?(String))
      raise('the policyname attribute should be of String type!')
    end
    ret[GluCfn::ResourcePropertyType::LBOrAppCookieStickinessPolicy::Policy_Name] = policyname.policyname
  end
  if policyname.cookieexpirationperiod
    if(!policyname.cookieexpirationperiod.is_a?(String))
      raise('the cookieexpirationperiod attribute should be of String type!')
    end
    ret[GluCfn::ResourcePropertyType::LBOrAppCookieStickinessPolicy::Cookie_Expiration_Period] = policyname.cookieexpirationperiod
  end
  return ret
end

def createAppCookieStickinessPolicy(policyname)
  if(!policyname.is_a?(AppCookieStickinessPolicy))
    raise('the input parameter should be of AppCookieStickinessPolicy type!')
  end
  ret = Hash.new
  if policyname.cookiename
    if(!policyname.cookiename.is_a?(String))
      raise('the cookiename attribute should be of String type!')
    end
    ret[GluCfn::ResourcePropertyType::AppCookieStickinessPolicy::Cookie_Name] = policyname.cookiename
  end
  if policyname.policyname
    if(!policyname.policyname.is_a?(String))
      raise('the policyname attribute should be of String type!')
    end
    ret[GluCfn::ResourcePropertyType::AppCookieStickinessPolicy::Policy_Name] = policyname.policyname
  end
  return ret
end

def createLBCookieStickinessPolicy(policyname)
  if(!policyname.is_a?(LBCookieStickinessPolicy))
    raise('the input parameter should be of LBCookieStickinessPolicy type!')
  end
  ret = Hash.new
  if policyname.cookieexpirationperiod
    if(!policyname.cookieexpirationperiod.is_a?(String))
      raise('the cookieexpirationperiod attribute should be of String type!')
    end
    ret[GluCfn::ResourcePropertyType::LBCookieStickinessPolicy::Cookie_Expiration_Period] = policyname.cookieexpirationperiod
  end
  if policyname.policyname
    if(!policyname.policyname.is_a?(String))
      raise('the policyname attribute should be of String type!')
    end
    ret[GluCfn::ResourcePropertyType::LBCookieStickinessPolicy::Policy_Name] = policyname.policyname
  end
  return ret
end

def createConnectionDrainingPolicy(policyname)
  if(!policyname.is_a?(ConnectionDrainingPolicy))
    raise('the input parameter should be of ConnectionDrainingPolicy type!')
  end
  ret = Hash.new
  if !policyname.enabled.is_a?(NilClass)
    if(!(policyname.enabled.is_a?(TrueClass)||policyname.enabled.is_a?(FalseClass)))
      raise('the enabled attribute should be of Boolean type!')
    end
    ret[GluCfn::ResourcePropertyType::ConnectionDrainingPolicy::Enabled] = policyname.enabled
  end
  if policyname.timeout
    if(!policyname.timeout.is_a?(Fixnum))
      raise('the timeout attribute should be of Fixnum type!')
    end
    ret[GluCfn::ResourcePropertyType::ConnectionDrainingPolicy::Timeout] = policyname.timeout
  end
  return ret
end

def createConnectionSettings(setting)
  if(!setting.is_a?(ConnectionSettings))
    raise('the input parameter should be of ConnectionSettings')
  end
  ret = Hash.new
  if setting.idletimeout
    if(!setting.idletimeout.is_a?(Fixnum))
      raise('the idletimeout attribute should be of Fixnum type!')
    end
    ret[GluCfn::ResourcePropertyType::ConnectionSettings::Idle_Timeout] = setting.idletimeout
  end
  return ret
end

def createElasticLoadBalancingPolicy(policyname)
  if(!policyname.is_a?(ElasticLoadBalancingPolicy))
    raise('the input parameter should be of ElasticLoadBalancingPolicy type!')
  end
  ret = Hash.new
  if policyname.attributes
    if(!policyname.attributes.is_a?(Array))
      raise('the attributes attribute should be of Array type!')
    end
    policyname.attributes.each do |attribute|
      if(!attribute.is_a?(String))
        raise('each attribute should be of String type!')
      end
    end
    ret[GluCfn::ResourcePropertyType::ElasticLoadBalancingPolicy::Attributes] = policyname.attributes
  end
  if policyname.instanceports
    if(!policyname.instanceports.is_a?(Array))
      raise('the instanceports attribute should be of Array type!')
    end
    policyname.instanceports.each do |instanceport|
      if(!instanceport.is_a?(String))
        raise('each instanceport should be of String type!')
      end
    end
    ret[GluCfn::ResourcePropertyType::ElasticLoadBalancingPolicy::Instance_Ports] = policyname.instanceports
  end
  if policyname.loadbalancerports
    if(!policyname.loadbalancerports.is_a?(Array))
      raise('the loadbalancerports attribute should be of Array type!')
    end
    policyname.loadbalancerports.each do |loadbalancerport|
      if(!loadbalancerport.is_a?(String))
        raise('each loadbalancerport should be of String type!')
      end
    end
    ret[GluCfn::ResourcePropertyType::ElasticLoadBalancingPolicy::Load_Balancer_Ports] = policyname.loadbalancerports
  end
  return ret
end

def createHealthCheck(healthCheck)
  if(!healthCheck.is_a?(HealthCheck))
    raise('the input parameter should be of HealthCheck type!')
  end
  ret = Hash.new
  if healthCheck.healthy_threshold
    if(!healthCheck.healthy_threshold.is_a?(String))
      raise('the healthy_threshold attribute should be of String type!')
    end
    ret[GluCfn::ResourcePropertyType::HealthCheck::Healthy_Threshold]=healthCheck.healthy_threshold
  end
  if healthCheck.interval
    if(!healthCheck.interval.is_a?(String))
      raise('the interval attribute should be of String type!')
    end
    ret[GluCfn::ResourcePropertyType::HealthCheck::Interval]=healthCheck.interval
  end
  if healthCheck.target
    if(!healthCheck.target.is_a?(String))
      raise('the target attribute should be of String type!')
    end
    ret[GluCfn::ResourcePropertyType::HealthCheck::Target]=healthCheck.target
  end
  if healthCheck.timeout
    if(!healthCheck.timeout.is_a?(String))
      raise('the timeout attribute should be of String type!')
    end
    ret[GluCfn::ResourcePropertyType::HealthCheck::Timeout]=healthCheck.timeout
  end
  if healthCheck.unhealthy_threshold
    if(!healthCheck.unhealthy_threshold.is_a?(String))
      raise('the unhealthy_threshold attribute should be of String type!')
    end
    ret[GluCfn::ResourcePropertyType::HealthCheck::Unhealthy_Threshold]=healthCheck.unhealthy_threshold
  end
  return ret
end

def createTag(tag)
  if(!tag.is_a?(EC2Tag))
    raise('the input parameter should be of EC2Tag type!')
  end
  if(!tag.key)
    raise('the key attribute must be specified!')
  end
  if(!tag.value)
    raise('the value attribute must be specified!')
  end
  ret = Hash.new
  ret['Key'] = tag.key
  ret['Value'] = tag.value
  return ret
end