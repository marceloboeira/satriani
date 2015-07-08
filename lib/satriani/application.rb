# Adapted from -> Rum, the gRand Unified Mapper
#
# @see http://github.com/chneukirchen/rum

require "rack"

class Rack::Response
  def redirect(target, status = 302)
    self.status = status
    self["Location"] = target
  end
end

module Satriani 
  class Application
    attr_reader :env, :req, :res

    def initialize(&block)
      @block = block
    end

    def call(env)
      dup._call(env)
    end

    def _call(env)
      @env = env
      @req = Rack::Request.new(env)
      @res = Rack::Response.new
      @matched = false
      catch(:satriani_run_next_app) {
        instance_eval(&@block)
        @res.status = 404  unless @matched || !@res.empty?
        return @res.finish
      }.call(env)
    end

    def on(*arg, &block)
      return if @matched
      s, p = env["SCRIPT_NAME"], env["PATH_INFO"]
      yield *arg.map { |a| a == true || (a != false && a.call) || return }
      env["SCRIPT_NAME"], env["PATH_INFO"] = s, p
      @matched = true
    end

    def any(*args)
      args.any? { |a| a == true || (a != false && a.call) }
    end

    def also
      @matched = false
    end

    def path(p)
      lambda {
        if env["PATH_INFO"] =~ /\A\/(#{p})(\/|\z)/
          env["SCRIPT_NAME"] += "/#{$1}"
          env["PATH_INFO"] = $2 + $'
          $1
        end
      }
    end

    def number
      path("\\d+")
    end

    def segment
      path("[^\\/]+")
    end

    def extension(e="\\w+")
      lambda { env["PATH_INFO"] =~ /\.(#{e})\z/ && $1 }
    end

    def param(p, default = nil)
      lambda { request[p] || default }
    end

    def header(p, default = nil)
      lambda { env[p.upcase.tr('-','_')] || default }
    end

    def default
      true
    end

    def host(h)
      req.host == h
    end

    def method(m)
      req.request_method = m
    end

    def get; req.get?; end
    def post; req.post?; end
    def put; req.put?; end
    def delete; req.delete?; end

    def accept(mimetype)
      lambda do
        env['HTTP_ACCEPT'].split(',').any? { |s| s.strip == mimetype } &&
          res['Content-Type'] = mimetype
      end
    end

    def check(&block)
      block
    end

    def run(app)
      throw :satriani_run_next_app, app
    end

    def puts(*args)
      args.each do |s|
        res.write s
        res.write "\n"
      end
    end

    def print(*args)
      args.each do |s| 
        res.write s 
      end
    end
  end
end
