require_relative '../../common/type/resource_property'
require_relative '../../resource/elb'
require_relative './resource_type_creator'

def createELB(elb)
  # pre checks
  if(!elb.is_a?(ELB))
    raise('the input parameter should be of ELB type!')
  end
  if(!elb.name)
    raise('the name attribute should be specified!')
  end
  if(!elb.type)
    raise('the type attribute should be specified!')
  end
  if(!elb.name.is_a?(String))
    raise('the name attribute should be of String type!')
  end
  if(!elb.type.is_a?(String))
    raise('the type attribute should be of String type!')
  end

  Resource(elb.name) do
    Type(elb.type)
    if(elb.getDeletionPolicy)
      DeletionPolicy(elb.getDeletionPolicy)
    end

    if elb.availabilityzones
      if(!elb.availabilityzones.is_a?(Array))
        raise('the availabilityzones attribute should be of Array type!')
      end
      elb.availabilityzones.each do |availabilityzones|
        if(!availabilityzones.is_a?(String))
          raise('each availabilityzone should be of String type!')
        end
      end
      Property(GluCfn::ResourceProperty::AVAILABILITY_ZONES,elb.availabilityzones)
    end
    if !elb.crosszone.is_a?(NilClass)
      if(!(elb.crosszone.is_a?(TrueClass)||elb.crosszone.is_a?(FalseClass)))
        raise('the crosszone attribute should be of boolean type!')
      end
      Property(GluCfn::ResourceProperty::CROSS_ZONE, elb.crosszone)
    end
    if elb.healthcheck
      if(!elb.healthcheck.is_a?(HealthCheck))
        raise('the healthcheck attribute should be of HealthCheck type!')
      end
      Property(GluCfn::ResourceProperty::HEALTH_CHECK, createHealthCheck(elb.healthcheck))
    end
    if elb.instances
      if(!elb.instances.is_a?(Array))
        raise('the instances attribute should be of Array type!')
      end
      elb.instances.each do |instance|
        if(!(instance.is_a?(CfnDsl::RefDefinition)||instance.is_a?(String)))
          raise('each instance should be of Ref String type!')
        end
      end
      Property(GluCfn::ResourceProperty::INSTANCES, elb.instances)
    end
    if elb.listeners
      if(!elb.listeners.is_a?(Array))
        raise('the listeners attribute should be of Array type!')
      end
      a_listeners = Array.new
      elb.listeners.each do |listener|
        if(!listener.is_a?(Listener))
          raise('each listener should be of Listener type!')
        end
        a_listeners.insert(-1,createListener(listener))
      end
      Property(GluCfn::ResourceProperty::LISTENERS, a_listeners)
    end
    if elb.appcookiestickinesspolicy
      if(!elb.appcookiestickinesspolicy.is_a?(AppCookieStickinessPolicy))
        raise('the appcookiestickinesspolicy attribute should be of AppCookieStickinessPolicy type!')
      end
      Property(GluCfn::ResourceProperty::APP_COOKIE_STICKINESS_POLICY, createAppCookieStickinessPolicy(elb.appcookiestickinesspolicy))
    end
    if elb.lbcookiestickinesspolicy
      if(!elb.lbcookiestickinesspolicy.is_a?(LBCookieStickinessPolicy))
        raise('the lbcookiestickinesspolicy attribute should be of LBCookieStickinessPolicy type!')
      end
      Property(GluCfn::ResourceProperty::LB_COOKIE_STICKINESS_POLICY, createLBCookieStickinessPolicy(elb.lbcookiestickinesspolicy))
    end
    if elb.scheme
      if(!elb.scheme.is_a?(String))
        raise('the scheme attribute should be of String type!')
      end
      Property(GluCfn::ResourceProperty::SCHEME, elb.scheme)
    end
    if elb.securitygroups
      if(!elb.securitygroups.is_a?(Array))
        raise('the securitygroups attribute should be of Array type!')
      end
      elb.securitygroups.each do |securitygroup|
        if(!(securitygroup.is_a?(CfnDsl::RefDefinition)||securitygroup.is_a?(String)))
          raise('each securitygroup should be of Ref or String type!')
        end
      end
      Property(GluCfn::ResourceProperty::SECURITY_GROUPS, elb.securitygroups)
    end
    if elb.subnets
      if(!elb.subnets.is_a?(Array))
        raise('the securitygroups attribute should be of Array type!')
      end
      elb.subnets.each do |subnet|
        if(!subnet.is_a?(String))
          raise('each subnet should be of String type!')
        end
      end
      Property(GluCfn::ResourceProperty::SUBNETS, elb.subnets)
    end
    if elb.connectiondrainingpolicy
      if(!elb.connectiondrainingpolicy.is_a?(ConnectionDrainingPolicy))
        raise('the connectiondrainingpolicy attribute should be of ConnectionDrainingPolicy type!')
      end
      Property(GluCfn::ResourceProperty::CONNECTION_DRAINING_POLICY, createConnectionDrainingPolicy(elb.connectiondrainingpolicy))
    end
    if elb.connectionsettings
      if(!elb.connectionsettings.is_a?(ConnectionSettings))
        raise('the connectionsettings attribute should be of ConnectionSettings type!')
      end
      Property(GluCfn::ResourceProperty::CONNECTION_SETTINGS, createConnectionSettings(elb.connectionsettings))
    end
    if elb.loadbalancername
      if(!elb.loadbalancername.is_a?(String))
        raise('the loadbalancername attribute should be of String type!')
      end
      Property(GluCfn::ResourceProperty::LOAD_BALANCER_NAME, elb.loadbalancername)
    end
    if elb.policies
      if(!elb.policies.is_a?(Array))
        raise('the policies attribute should be of Array type!')
      end
      a_policies = Array.new
      elb.policies.each do |policy|
        if(!policy.is_a?(ElasticLoadBalancingPolicy))
          raise('each policy should be of ElasticLoadBalancingPolicy type!')
        end
        a_policies.insert(-1,createElasticLoadBalancingPolicy(policy))
      end
      Property(GluCfn::ResourceProperty::POLICIES, a_policies)
    end
  end
end
