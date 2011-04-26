Factory.define :post do |f|
  f.title 'Post title'
end

Factory.define :hostname do |f|
  f.hostname 'example.com'
end

Factory.define :site do |f|
  f.name 'ex'
  f.hostnames {|site| [site.association(:hostname),
                       site.association(:hostname, :hostname=>'test.host')]}
end