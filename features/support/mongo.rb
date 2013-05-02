require 'mongo-configure'

After do
  Mongo::Configure.current.load.collections.select { |c| c.name !~ /^system\./ }.each &:remove
end
