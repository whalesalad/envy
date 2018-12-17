require "json"

def array_zip(keys, values) : Array(Array(String))
  ([] of Array(String)).tap do |x|
    keys.each_with_index do |key, i|
      x << [key, values[i]]
    end
  end
end

def command_to_str(command : String) : String
  IO::Memory.new.tap do |output|
    Process.run(command, shell: true, output: output)
  end.to_s.strip
end

module Envy
  class EnvInfo
    def env_pairs
      array_zip(ENV.keys, ENV.values).sort_by do |pair|
        pair[0]
      end
    end

    def environment
      env_pairs.to_h
    end

    def uname
      command_to_str "uname -a"
    end

    def hostname
      command_to_str "hostname"
    end

    def info
      {
        "environment": environment,
        "uname":       uname,
        "hostname":    hostname,
      }
    end

    def to_json
      info.to_json
    end
  end
end
